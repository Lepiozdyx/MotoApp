//
//  TheoryService.swift
//  MotoControl
//
//  Created by Alex on 16.09.2023.
//

import CoreData

final class TheoryService {
    
    private let persistenceController: PersistenceController
    
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }
    
    // MARK: CRUD
    func createTheory(with model: TheoryModel) {
        let newTheory = Theory(context: persistenceController.container.viewContext)
        newTheory.title = model.title
        newTheory.definition = model.definition
        newTheory.videoID = model.videoID
        newTheory.image = model.image
        
        saveContext()
    }
    
    func fetchTheories() -> [TheoryModel] {
        let request: NSFetchRequest<Theory> = Theory.fetchRequest()
        
        do {
            let fetchedTheory = try persistenceController.container.viewContext.fetch(request)
            return fetchedTheory.map {
                TheoryModel(title: $0.title ?? "", definition: $0.definition ?? "", videoID: $0.videoID, image: $0.image)
            }
        } catch {
            print("Failed to fetch theories: \(error)")
            return []
        }
    }
    
    func updateTheory(_ theory: Theory, with model: TheoryModel) {
        theory.title = model.title
        theory.definition = model.definition
        theory.videoID = model.videoID
        theory.image = model.image
        
        saveContext()
    }
    
    func deleteTheory(_ theory: Theory) {
        persistenceController.container.viewContext.delete(theory)
        saveContext()
    }
    
    private func saveContext() {
        if persistenceController.container.viewContext.hasChanges {
            do {
                try persistenceController.container.viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
