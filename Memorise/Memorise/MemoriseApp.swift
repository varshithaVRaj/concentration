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
    
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
