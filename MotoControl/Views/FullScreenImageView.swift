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
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {isFullScreen.toggle()}, label: {Image(systemName: "xmark")})
                .position(x: UIScreen.main.bounds.width - 30, y: 45)
        }
        .background(Color(.black))
    }
}

#Preview {
    FullScreenImageView(image: "КакПоднятьУпавшийМотоцикл?", isFullScreen: .constant(true))
}
