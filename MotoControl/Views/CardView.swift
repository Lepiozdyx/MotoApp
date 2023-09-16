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
        VStack(spacing: 40) {
            Text(title)
                .font(.title)
            
            Image(systemName: "play.rectangle")
                .resizable()
                .frame(width: 120, height: 100)
        }
        .padding()
        .frame(width: 200, height: 250)
        .background(Color(.gray))
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .overlay {
            RoundedRectangle(cornerRadius: 40)
                .stroke(.gray, lineWidth: 1)
        }
        .shadow(color: .white, radius: 10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "Theory")
    }
}
