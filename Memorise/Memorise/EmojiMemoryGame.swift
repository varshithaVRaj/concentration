//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Varshitha VRaj on 03/09/25.
//

import SwiftUI

//MARK: EMOJI VIEW MODEL

//MARK: CREATE A GLOBAL FUNCTION TO RETURN THE EMOJI'S


class EmojiMemoryGame: ObservableObject {
    
    private static let emoji = ["👀", "🎃", "🕷️", "😈", "🐻", "☠️", "🥳", "😎", "🤭", "🤬", "🤢", "💄", "🧚🏼", "💕", "✌🏽", "☘️", "🐒", "🎲"]
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame <String> {
        return MemoryGame(numberOfPairs: 10){ index in
            if emoji.indices.contains(index) {
                return emoji[index]
            }else{
                return "⁉️"
            }
        }
    }
    
    
    var color: Color{
        .orange
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
     
    func shuffle(){
        model.shuffle()
    }

}
