//
//  EmojiMemoryGameView.swift
//  Memorise
//
//  Created by Varshitha VRaj on 23/08/25.
//

import SwiftUI
struct  EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack{
            cardBody
                .animation(.default, value: viewModel.cards)
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    
    private var cardBody: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: aspectRatio){ card in
            
            if card.id.last == "b"{
                VStack{
                    CardView(card: card)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card: card)
                        }
                    Text(card.id)
                }
            }
        }
        .foregroundColor(Color.orange)
    }
    
    
    
    
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

struct CardView: View{
    
    let card: MemoryGame<String>.Card
    
    init(card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.largeTitle)
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUP ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUP ? 0 : 1)
        }
        .opacity(card.isFaceUP || !card.isMatched ? 1 : 0)
    }
    
    
}
