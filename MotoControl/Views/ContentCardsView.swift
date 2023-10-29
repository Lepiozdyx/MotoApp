//
//  ContentCardsView.swift
//  MotoControl
//
//  Created by Alex on 12.09.2023.
//

import SwiftUI

struct ContentCardsView: View {
    @ObservedObject var viewModel: ContentListViewModel
    
    var body: some View {
        NavigationStack {
            HeaderView(contentType: viewModel.contentType)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(viewModel.contents, id: \.self) { content in
                        NavigationLink(destination: ContentDetailView(viewModel: ContentDetailViewModel(content: content))) {
                            CardView(title: content.title)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentCardsView(viewModel: ContentListViewModel(contentType: .theory))
}
