//
//  ContentView.swift
//  MotoControl
//
//  Created by Alex on 12.09.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        TabView {
            TheoryListView(viewModel: TheoryListViewModel())
                .tabItem {
                    Label("Theory", systemImage: "book.closed.fill")
                }
            Text("Example")
                .tabItem {
                    Label("Упражнения", systemImage: "figure.outdoor.cycle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
