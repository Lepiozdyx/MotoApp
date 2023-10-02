//
//  ContentModel.swift
//  MotoControl
//
//  Created by Alex on 15.09.2023.
//

import Foundation

enum ContentType: String {
    case theory = "Theory"
    case roadStrategy = "Road Strategy"
}

struct ContentModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let definition: String
    let videoID: [String]?
    let image: [String]?
    let contentType: ContentType
}
