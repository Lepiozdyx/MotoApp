//
//  ContentService.swift
//  MotoControl
//
//  Created by Alex on 16.09.2023.
//

import CoreData

final class ContentService {
    
    private let persistenceController: PersistenceController
    
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }
    
    // MARK: CRUD
    func createContent(with model: ContentModel) {
        let context = persistenceController.container.viewContext
        let newContent = Content(context: context)
        newContent.title = model.title
        newContent.definition = model.definition
        newContent.contentType = model.contentType.rawValue
        
        // Создание объектов Image и добавление их к Content
        if let images = model.image {
            images.forEach { image in
                let contentImage = ContentImage(context: context)
                contentImage.filename = image
                newContent.addToImages(contentImage)
            }
        }
        
        // Создание объектов Video и добавление их к Content
        if let videos = model.videoID {
            videos.forEach { video in
                let contentVideo = ContentVideo(context: context)
                contentVideo.filename = video
                newContent.addToVideos(contentVideo)
            }
        }
        
        saveContext()
    }
    
    func fetchContents(_ type: ContentType) -> [ContentModel] {
        let request: NSFetchRequest<Content> = Content.fetchRequest()
        request.predicate = NSPredicate(format: "contentType == %@", type.rawValue)
        
        do {
            let fetchedContents = try persistenceController.container.viewContext.fetch(request)
            return fetchedContents.map { content in
                let images = content.images?.allObjects as? [ContentImage]
                let videos = content.videos?.allObjects as? [ContentVideo]
                
                return ContentModel(
                    title: content.title ?? "",
                    definition: content.definition ?? "",
                    videoID: videos?.compactMap { $0.filename },
                    image: images?.compactMap { $0.filename },
                    contentType: type
                )
            }
        } catch {
            print("Failed to fetch theories: \(error)")
            return []
        }
    }
    
    func updateContent(_ content: Content, with model: ContentModel) {
//        let context = persistenceController.container.viewContext
        content.title = model.title
        content.definition = model.definition
        content.contentType = model.contentType.rawValue
        // TODO: логику обновления изображений и видео. Например, удалить старые и добавить новые.
        
        saveContext()
    }
    
    func deleteContent(_ theory: Content) {
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
