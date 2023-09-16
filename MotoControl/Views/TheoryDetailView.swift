//
//  TheoryDetailView.swift
//  MotoControl
//
//  Created by Alex on 16.09.2023.
//

import SwiftUI

struct TheoryDetailView: View {
    @ObservedObject var viewModel: TheoryDetailViewModel
    
    var body: some View {
        VStack {
            if let image = viewModel.theory.image {
                Image(image)
                    .resizable()
                    .scaledToFit()
            }
            
            Text(viewModel.theory.definition)
                .padding()
            
            if let videoUrl = viewModel.theory.videoURL {
                Link("Watch video", destination: videoUrl)
                    .padding()
            }
            Spacer()
        }
        .navigationTitle(viewModel.theory.title)
    }
}

struct TheoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TheoryDetailView(viewModel: TheoryDetailViewModel(theory: TheoryModel(title: "Theory", definition: "Some Definition", videoURL: nil, image: "")))
    }
}
