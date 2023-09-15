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
    
    @State private var theories: [TheoryModel] = []
    
    func loadData() {
        theories = DataManager.shared.getTheory()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(theories, id: \.self) { theory in
                    Text(theory.title)
                }
            }
            .onAppear(perform: loadData)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
