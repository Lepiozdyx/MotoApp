//
//  Persistence.swift
//  MotoControl
//
//  Created by Alex on 12.09.2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MotoControl")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // MARK: CRUD
    func createTheory(with model: TheoryModel) {
        let newTheory = Theory(context: container.viewContext)
        newTheory.title = model.title
        newTheory.definition = model.definition
        newTheory.videoURL = model.videoURL
        newTheory.image = model.image
        
        saveContext()
    }
    
    func fetchTheories() -> [TheoryModel] {
        let request: NSFetchRequest<Theory> = Theory.fetchRequest()
        
        do {
            let fetchedTheory = try container.viewContext.fetch(request)
            return fetchedTheory.map {
                TheoryModel(title: $0.title ?? "", definition: $0.definition ?? "", videoURL: $0.videoURL, image: $0.image)
            }
        } catch {
            print("Failed to fetch theories: \(error)")
            return []
        }
    }
    
    func updateTheory(_ theory: Theory, with model: TheoryModel) {
        theory.title = model.title
        theory.definition = model.definition
        theory.videoURL = model.videoURL
        theory.image = model.image
        
        saveContext()
    }
    
    func deleteTheory(_ theory: Theory) {
        container.viewContext.delete(theory)
        saveContext()
    }
    
    private func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
