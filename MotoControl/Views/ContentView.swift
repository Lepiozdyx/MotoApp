//
//  ContentView.swift
//  MotoControl
//
//  Created by Alex on 12.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            ContentCardsView(viewModel: ContentListViewModel(contentType: .theory))
                .tabItem {
                    Label("Теория", systemImage: "text.book.closed.fill")
                }
            ContentCardsView(viewModel: ContentListViewModel(contentType: .roadStrategy))
                .tabItem {
                    Label("Дорожная стратегия", systemImage: "arrowshape.down.circle.fill")
                }
            Text("Example")
                .tabItem {
                    Label("Упражнения", systemImage: "figure.outdoor.cycle")
                }
        }
    }
}

#Preview {
    ContentView()
}
