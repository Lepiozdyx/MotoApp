//
//  ContentListView.swift
//  MotoControl
//
//  Created by Alex on 19.09.2023.
//

import SwiftUI

struct ContentListView: View {
    @ObservedObject var viewModel: ContentListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.contents, id: \.self) { content in
                    NavigationLink(destination: ContentDetailView(viewModel: ContentDetailViewModel(content: content))) {
                            Text(content.title)
                    }
                }
            }
            .navigationTitle("Теория")
        }
    }
}

#Preview {
    ContentListView(viewModel: ContentListViewModel(contentType: .theory))
}
