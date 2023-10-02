//
//  DataManager.swift
//  MotoControl
//
//  Created by Alex on 15.09.2023.
//

final class DataManager {
    static let shared = DataManager()
    
    private let persistenceController: PersistenceController
    private let contentService: ContentService
    
    private init() {
        self.persistenceController = PersistenceController.shared
        self.contentService = ContentService(persistenceController: persistenceController)
        
        populateInitialDataIfNeeded()
    }
    
    func createContent(with model: ContentModel) {
        contentService.createContent(with: model)
    }
    
    func getContent(_ type: ContentType) -> [ContentModel] {
        return contentService.fetchContents(type)
    }
    
    private func populateInitialDataIfNeeded() {
        let existingContents = getContent(.theory) + getContent(.roadStrategy)
        // Здесь может потребоваться проверка для каждого типа контента
        // или, если InitialData содержит разные типы контента, можно выполнить проверку для каждого типа контента в InitialData
                
        if existingContents.isEmpty {
            InitialData.theoryData.forEach { createContent(with: $0) }
            InitialData.roadStrategyData.forEach { createContent(with: $0) }
        }
    }
}
