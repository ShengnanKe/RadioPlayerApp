//
//  RadioPlayerView.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//

import SwiftUI
import AVKit

struct RadioPlayerView: View {
    let radio: RadioInfo
    @State private var player: AVPlayer?
    @State private var isPlaying = false

    var body: some View {
        VStack {
            Text(radio.name ?? "none")
                .font(.largeTitle)
                .padding()
            Text("Country: \(radio.country)")
                .font(.subheadline)
            Text(radio.url ?? "none")
                .font(.subheadline)
            Text(radio.urlResolved ?? "none")
                .font(.subheadline)
            HStack {
                Button(action: {
                    if let url = URL(string: radio.urlResolved ?? "default url") {
                        player = AVPlayer(url: url)
                        player?.play()
                        isPlaying = true
                    }
                }) {
                    Text("Play")
                        .foregroundColor(.blue)
                }
                .padding()
                
                Button(action: {
                    player?.pause()
                    isPlaying = false
                }) {
                    Text("Stop")
                        .foregroundColor(.red)
                }
                .padding()
            }
        }
        .navigationTitle("Radio Player")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}
