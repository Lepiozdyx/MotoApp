//
//  HeaderView.swift
//  MotoControl
//
//  Created by Alex on 24.09.2023.
//

import SwiftUI

struct HeaderView: View {
    @State private var isShowingListView = false
    let contentType: ContentType
    var title: String {
        switch contentType {
        case .theory:
            "Теория"
        case .roadStrategy:
            "Дорожная стратегия"
        }
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Button("См. все") {
                isShowingListView.toggle()
            }
            .navigationDestination(isPresented: $isShowingListView, destination: getDestination)
        }
        .padding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16))
    }
    
    private func getDestination() -> some View {
        ContentListView(viewModel: ContentListViewModel(contentType: contentType))
    }
}

#Preview {
    HeaderView(contentType: .roadStrategy)
}
