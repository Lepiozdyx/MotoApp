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
        let context = persistenceController.container.viewContext
        let newTheory = Theory(context: context)
        newTheory.title = model.title
        newTheory.definition = model.definition
        
        // Создание объектов TheoryImage и добавление их к Theory
        if let images = model.image {
            images.forEach { image in
                let theoryImage = TheoryImage(context: context)
                theoryImage.filename = image
                newTheory.addToImages(theoryImage)
            }
        }
        
        // Создание объектов TheoryVideo и добавление их к Theory
        if let videos = model.videoID {
            videos.forEach { video in
                let theoryVideo = TheoryVideo(context: context)
                theoryVideo.filename = video
                newTheory.addToVideos(theoryVideo)
            }
        }
        
        saveContext()
    }
    
    func fetchTheories() -> [TheoryModel] {
        let request: NSFetchRequest<Theory> = Theory.fetchRequest()
        
        do {
            let fetchedTheory = try persistenceController.container.viewContext.fetch(request)
            return fetchedTheory.map { theory in
                let images = theory.images?.allObjects as? [TheoryImage]
                let videos = theory.videos?.allObjects as? [TheoryVideo]
                
                return TheoryModel(
                    title: theory.title ?? "",
                    definition: theory.definition ?? "",
                    videoID: videos?.compactMap { $0.filename },
                    image: images?.compactMap { $0.filename }
                )
            }
        } catch {
            print("Failed to fetch theories: \(error)")
            return []
        }
    }
    
    func updateTheory(_ theory: Theory, with model: TheoryModel) {
        let context = persistenceController.container.viewContext
        theory.title = model.title
        theory.definition = model.definition
        // TODO: логику обновления изображений и видео. Например, удалить старые и добавить новые.
        
        saveContext()
    }
    
    func deleteTheory(_ theory: Theory) {
        persistenceController.container.viewContext.delete(theory)
        saveContext()
    }
    
    private func saveContext() {
        let context = persistenceController.container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
