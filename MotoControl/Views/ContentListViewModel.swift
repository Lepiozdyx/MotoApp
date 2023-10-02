//
//  TheoryListViewModel.swift
//  MotoControl
//
//  Created by Alex on 16.09.2023.
//

import Foundation

final class ContentListViewModel: ObservableObject {
    @Published var contents: [ContentModel] = []
    private let dataManager = DataManager.shared
    private let contentType: ContentType
    
    init(contentType: ContentType) {
        self.contentType = contentType
        fetchContents()
    }
    
    private func fetchContents() {
        contents = dataManager.getContent(contentType)
    }
}
