//
//  CardView.swift
//  MotoControl
//
//  Created by Alex on 12.09.2023.
//

import SwiftUI

struct CardView: View {
    let title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color(.milkGreen))
                .frame(width: .infinity, height: 200)
                .padding([.leading, .trailing], 16)
                .shadow(radius: 2)
            
            Text(title)
                .font(.title3)
                .foregroundStyle(.secondary)
                .frame(width: 350, height: 100, alignment: .top)
                .offset(x: 0, y: -40)
                
            Image(systemName: "camera")
                .resizable()
                .foregroundStyle(.secondary)
                .frame(width: 100, height: 80)
                .offset(x: 0, y: 50)
        }
    }
}

#Preview {
    CardView(title: "Как поднять упавший мотоцикл?")
}
