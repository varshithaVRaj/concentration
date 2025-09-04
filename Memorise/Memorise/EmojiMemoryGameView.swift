//
//  EmojiMemoryGameView.swift
//  Memorise
//
//  Created by Varshitha VRaj on 23/08/25.
//
import SwiftUI
struct  EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            ScrollView {
            cardBody
            .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cardBody: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards){ card in
                VStack(spacing: 0){
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card: card)
                        }
                    Text(card.id)
                }
            }
            
        }
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
