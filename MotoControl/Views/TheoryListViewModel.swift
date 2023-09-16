//
//  TheoryListViewModel.swift
//  MotoControl
//
//  Created by Alex on 16.09.2023.
//

import Foundation

final class TheoryListViewModel: ObservableObject {
    @Published var theories: [TheoryModel] = []
    
    private let dataManager = DataManager.shared
    
    init() {
        fetchTheories()
    }
    
    private func fetchTheories() {
        theories = dataManager.getTheory()
    }
}
