//
//  TheoryCardsView.swift
//  MotoControl
//
//  Created by Alex on 12.09.2023.
//

import SwiftUI

struct TheoryCardsView: View {
    @ObservedObject var viewModel: TheoryListViewModel
    @State private var isShowingListView = false
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("Теория")
                    .font(.headline)
                Spacer()
                Button("См. все") {
                    isShowingListView.toggle()
                }
                .navigationDestination(isPresented: $isShowingListView) {
                    TheoryListView(viewModel: TheoryListViewModel())
                }
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
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
