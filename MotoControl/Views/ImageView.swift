//
//  ImageView.swift
//  MotoControl
//
//  Created by Alex on 16.09.2023.
//

import SwiftUI

struct ImageView: View {
    let image: String
    let width: CGFloat
    let height: CGFloat
    @State private var isZoomed: Bool = false
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(
                width: isZoomed ? width * 1.5 : width,
                height: isZoomed ? height * 1.5 : height
            )
            .cornerRadius(20)
            .shadow(radius: 5)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isZoomed.toggle()
                }
            }
    }
}

#Preview {
    ImageView(image: "ТорможениеСАБС", width: 320, height: 220)
}
