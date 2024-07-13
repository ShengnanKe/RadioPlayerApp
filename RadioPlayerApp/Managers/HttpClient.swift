//
//  HttpClient.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/9/24.
//

import Foundation
import Combine
import SwiftUI
import UIKit

enum AppError: Error {
    case badURL
    case badResponse
    case badData
    case decoderError
    case serverError(Error?)
    
    var localizedDescription: String {
        switch self {
        case .badURL:
            return "The URL is invalid."
        case .badResponse:
            return "The response from the server was invalid."
        case .badData:
            return "The data from the server was invalid."
        case .decoderError:
            return "There was an error decoding the data."
        case .serverError(let error):
            return error?.localizedDescription ?? "An unknown server error occurred."
        }
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol RequestBuilder {
    var baseUrl: String { get }
    var path: String? { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryParam: [String: String]? { get }
    var bodyParam: Data? { get }
    
    func buildRequest() throws -> URLRequest
}

extension RequestBuilder {
    func buildRequest() throws -> URLRequest {
        guard var urlComponents = URLComponents(string: baseUrl) else {
            throw AppError.badURL
        }
        
        if let path = path {
            urlComponents.path = urlComponents.path.appending(path)
        }
        
        if let queryParam = queryParam {
            let encodedQuery = encodeParam(queryParam)
            urlComponents.query = encodedQuery
        }
        
        guard let url = urlComponents.url else {
            throw AppError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let bodyParam = bodyParam, method == .post {
            request.httpBody = bodyParam
        }
        
        return request
    }
    
    private func encodeParam(_ params: [String: String]) -> String? {
        var components = URLComponents()
        components.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components.percentEncodedQuery
    }
}

class HttpClient {
    func fetchData<T: Decodable>(from requestBuilder: RequestBuilder) -> AnyPublisher<T, Error> {
            do {
                let request = try requestBuilder.buildRequest()
                return URLSession.shared.dataTaskPublisher(for: request)
                    .tryMap { data, response in
                        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                            throw URLError(.badServerResponse)
                        }
                        return data
                    }
                    .decode(type: T.self, decoder: JSONDecoder())
                    .eraseToAnyPublisher()
            } catch {
                return Fail(error: error).eraseToAnyPublisher()
            }
        }
    
    
    
    
    
    func fetchData<T: Decodable>(from requestBuilder: RequestBuilder) async throws -> T {
        let request = try requestBuilder.buildRequest()
        
        // 打印请求信息
//        print("Request URL: \(request.url?.absoluteString ?? "N/A")")
//        print("Request Headers: \(request.allHTTPHeaderFields ?? [:])")
//        if let body = request.httpBody {
//            print("Request Body: \(String(data: body, encoding: .utf8) ?? "N/A")")
//        }

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            //print("Server response: \(String(data: data, encoding: .utf8) ?? "N/A")")
            throw AppError.badResponse
        }
        do {
            // 打印服务器返回的原始数据
            if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                //print("Response JSON: \(json)")
            } else {
                //print("Response Data: \(String(data: data, encoding: .utf8) ?? "N/A")")
            }

            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("Decoding error: \(error)")
            throw AppError.decoderError
        }
    }
}
    
    //    func fetchData(from url: URL) async throws -> Data {
    //        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
    //        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
    //            throw URLError(.badServerResponse)
    //        }
    //        return data
    //    }

