//
//  VideoView.swift
//  MotoControl
//
//  Created by Alex on 17.09.2023.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var videoURL: URL
    @State private var player: AVPlayer?
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear() {
                player = AVPlayer(url: videoURL)
                player?.play()
            }
            .onDisappear() {
                player?.pause()
                player = nil
            }
            .ignoresSafeArea(.all)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoURL: URL(string: "https://www.youtube.com/watch?v=iuvEJchW-Uc")!)
    }
}
