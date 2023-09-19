//
//  TheoryModel.swift
//  MotoControl
//
//  Created by Alex on 15.09.2023.
//

import Foundation

struct TheoryModel: Identifiable, Hashable {
    let title: String
    let definition: String
    let videoID: String?
    let image: String?
    let id = UUID()
}
