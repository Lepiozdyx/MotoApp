//
//  ImageView.swift
//  MotoControl
//
//  Created by Alex on 16.09.2023.
//

import SwiftUI

struct ImageView: View {
    @State private var isFullScreen: Bool = false
    let image: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: width,height: height)
            .cornerRadius(20)
            .onTapGesture {
                isFullScreen.toggle()
            }
            .fullScreenCover(isPresented: $isFullScreen) {
                FullScreenImageView(image: image, isFullScreen: $isFullScreen)
            }
    }
}

#Preview {
    ImageView(image: "ТорможениеСАБС", width: 320, height: 220)
}
