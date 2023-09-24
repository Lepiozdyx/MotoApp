//
//  TheoryCardsView.swift
//  MotoControl
//
//  Created by Alex on 12.09.2023.
//

import SwiftUI

struct TheoryCardsView: View {
    @ObservedObject var viewModel: TheoryListViewModel
    
    var body: some View {
        NavigationStack {
            HeaderView(title: "Теория") {
                TheoryListView(viewModel: TheoryListViewModel())
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(viewModel.theories, id: \.self) { theory in
                        NavigationLink(destination: TheoryDetailView(viewModel: TheoryDetailViewModel(theory: theory))) {
                            CardView(title: theory.title)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            Spacer()
        }
    }
}

#Preview {
    TheoryCardsView(viewModel: TheoryListViewModel())
}
