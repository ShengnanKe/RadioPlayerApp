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

    var body: some View {
        VStack {
            Text(radio.name)
                .font(.largeTitle)
                .padding()
            Text("Country: \(radio.country)")
                .font(.subheadline)
            Text(radio.url)
                .font(.subheadline)
            Text(radio.urlResolved)
                .font(.subheadline)
            Button(action: {
                if let url = URL(string: radio.urlResolved) {
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }) {
                Text("Play")
                    .foregroundColor(.blue)
            }
        }
        .navigationTitle("Radio Player")
        .navigationBarTitleDisplayMode(.inline)
    }
}
