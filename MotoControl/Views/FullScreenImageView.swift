//
//  FullScreenImageView.swift
//  MotoControl
//
//  Created by Alex on 17.09.2023.
//

import SwiftUI

struct FullScreenImageView: View {
    let image: String
    @Binding var isFullScreen: Bool
    @State private var scale: CGFloat = 1
    @State private var lastScaleValue: CGFloat = 1
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .scaleEffect(scale)
                        .gesture(MagnificationGesture()
                            .onChanged { value in
                                let delta = value / self.lastScaleValue
                                self.lastScaleValue = value
                                let newScale = self.scale * delta
                                self.scale = min(max(newScale, 0.5), 3)
                            }
                            .onEnded { value in
                                self.lastScaleValue = 1
                            }
                        )
                }
                .ignoresSafeArea(.all)
            }
            
            Button(action: {isFullScreen.toggle()}, label: {Image(systemName: "xmark")})
                .position(x: UIScreen.main.bounds.width - 30, y: 45)
        }
        .background(Color(.black))
    }
}

#Preview {
    FullScreenImageView(image: "КакПоднятьУпавшийМотоцикл?", isFullScreen: .constant(true))
}
