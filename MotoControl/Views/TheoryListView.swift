//
//  TheoryListView.swift
//  MotoControl
//
//  Created by Alex on 19.09.2023.
//

import SwiftUI

struct TheoryListView: View {
    @ObservedObject var viewModel: TheoryListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.theories, id: \.self) { theory in
                    NavigationLink(destination: TheoryDetailView(viewModel: TheoryDetailViewModel(theory: theory))) {
                            Text(theory.title)
                    }
                }
            }
            .navigationTitle("Теория")
        }
    }
}

#Preview {
    TheoryListView(viewModel: TheoryListViewModel())
}
