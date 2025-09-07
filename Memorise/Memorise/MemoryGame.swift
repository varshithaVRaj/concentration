//
//  MemoryGame.swift
//  Memorise
//
//  Created by Varshitha VRaj on 03/09/25.
//

import SwiftUI

//MARK: THIS IS THE MODEL CLASS

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        for pairIndex in 0..<max(2, numberOfPairs) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex + 1)a", content: content))
            cards.append(Card(id: "\(pairIndex + 1)b", content: content))
        }
    }
    
     
    //MARK: Dont remove this , this says the logic
//    var indexOfTheOneAndOnlyFaceUpCard: Int? {
//        
//        get{
//            var faceUpCardIndices = [Int]()
//            for index in cards.indices{
//                if cards[index].isFaceUP {
//                    faceUpCardIndices.append(index)
//                } }
//            if faceUpCardIndices.count == 1 {
//                return faceUpCardIndices.first
//            }else{
//                return nil
//            }
//        }
//        set{
//            for index in cards.indices{
//                if index == newValue{
//                    cards[index].isFaceUP = true
//                }else{
//                    cards[index].isFaceUP = false
//                }
//            }
//        }
//    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{ cards.indices.filter{ index in cards[index].isFaceUP}.only }
        set{ cards.indices.forEach{cards[$0].isFaceUP = (newValue == $0 )} }
    }
    
    mutating func choose(card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }){
            
            if !cards[chosenIndex].isFaceUP && !cards[chosenIndex].isMatched{
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    for index in cards.indices {
                        cards[index].isFaceUP = false
                    }
                }
                cards[chosenIndex].isFaceUP = true
            }
        }
    }
    

    private func index(of card: Card) -> Int? {
        for index in cards.indices{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }

    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible{
        
        var debugDescription: String{
            return "\(id): \(content) \(isFaceUP ? "up" : "down") \(isMatched ? "Matched" : "Not Matched")"
        }
        
        var id: String
        var isFaceUP = false
        var isMatched = false 
        var content: CardContent // CardContent is Generics here
    }
    
}

extension Array{
    var only: Element? {
        return count == 1 ? first : nil
    }
}
