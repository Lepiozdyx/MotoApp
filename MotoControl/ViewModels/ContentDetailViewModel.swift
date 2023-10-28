//
//  TheoryDetailViewModel.swift
//  MotoControl
//
//  Created by Alex on 16.09.2023.
//

import Foundation

final class ContentDetailViewModel: ObservableObject {
    @Published var content: ContentModel
    
    init(content: ContentModel) {
        self.content = content
    }
}
