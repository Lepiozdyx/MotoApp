//
//  TheoryDetailViewModel.swift
//  MotoControl
//
//  Created by Alex on 16.09.2023.
//

import Foundation

final class TheoryDetailViewModel: ObservableObject {
    @Published var theory: TheoryModel
    
    init(theory: TheoryModel) {
        self.theory = theory
    }
}
