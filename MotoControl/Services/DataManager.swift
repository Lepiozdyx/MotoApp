//
//  DataManager.swift
//  MotoControl
//
//  Created by Alex on 15.09.2023.
//

final class DataManager {
    static let shared = DataManager()
    
    private let persistenceController: PersistenceController
    private let theoryService: TheoryService
    
    private init() {
        self.persistenceController = PersistenceController.shared
        self.theoryService = TheoryService(persistenceController: persistenceController)
        
        populateInitialDataIfNeeded()
    }
    
    func createTheory(with model: TheoryModel) {
        theoryService.createTheory(with: model)
    }
    
    func getTheory() -> [TheoryModel] {
        return theoryService.fetchTheories()
    }
    
    private func populateInitialDataIfNeeded() {
        let existingTheories = theoryService.fetchTheories()
        
        if existingTheories.isEmpty {
            InitialData.theoryData.forEach { createTheory(with: $0) }
        }
    }
}
