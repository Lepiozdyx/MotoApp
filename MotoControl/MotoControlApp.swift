//
//  MotoControlApp.swift
//  MotoControl
//
//  Created by Alex on 12.09.2023.
//

import SwiftUI

@main
struct MotoControlApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
