//
//  MemoriseApp.swift
//  Memorise
//
//  Created by Varshitha VRaj on 23/08/25.
//

import SwiftUI

@main
struct MemoriseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
