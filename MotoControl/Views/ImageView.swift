//
//  ImageView.swift
//  MotoControl
//
//  Created by Alex on 16.09.2023.
//

import SwiftUI

struct ImageView: View {
    let image: String
    @State private var isFullScreen: Bool = false
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: 300,height: 220)
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
    ImageView(image: "ТорможениеСАБС")
}
