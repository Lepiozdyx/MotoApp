//
//  HeaderView.swift
//  MotoControl
//
//  Created by Alex on 24.09.2023.
//

import SwiftUI

struct HeaderView<Destination: View>: View {
    @State private var isShowingListView = false
    let title: String
    let destination: () -> Destination
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Button("См. все") {
                isShowingListView.toggle()
            }
            .navigationDestination(isPresented: $isShowingListView, destination: destination)
        }
        .padding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16))
    }
}

#Preview {
    HeaderView(title: "Теория") {
        ContentListView(viewModel: ContentListViewModel(contentType: .theory))
    }
}
