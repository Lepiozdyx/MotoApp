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
                .frame(width: 200, height: 250)
                .shadow(color: .black, radius: 2)
            
            Text(title)
                .font(.title3)
                .foregroundStyle(.secondary)
                .frame(width: 190, height: 100, alignment: .top)
                .offset(x: 0, y: -40)
                
            Image(systemName: "play.rectangle")
                .resizable()
                .foregroundStyle(.secondary)
                .frame(width: 80, height: 60)
                .offset(x: 0, y: 50)
                
        }
    }
}

#Preview {
    CardView(title: "Как поднять упавший мотоцикл?")
}
