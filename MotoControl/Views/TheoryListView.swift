//
//  TheoryListView.swift
//  MotoControl
//
//  Created by Alex on 12.09.2023.
//

import SwiftUI

struct TheoryListView: View {
    @ObservedObject var viewModel: TheoryListViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(viewModel.theories, id: \.self) { theory in
                        NavigationLink(destination: TheoryDetailView(viewModel: TheoryDetailViewModel(theory: theory))) {
                            CardView(title: theory.title)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Обучение вождению мотоцикла")
        }
    }
}


struct TheoryListView_Previews: PreviewProvider {
    static var previews: some View {
        TheoryListView(viewModel: TheoryListViewModel())
    }
}
