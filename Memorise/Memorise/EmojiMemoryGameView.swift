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
                .foregroundColor(viewModel.color)
            Button("Shuffle"){
                withAnimation() {
                    viewModel.shuffle()
                }
            }
        }
        .padding()
    }
 
    
    private var cardBody: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: aspectRatio){ card in
                VStack{
                    CardView(card: card)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                viewModel.choose(card: card)
                            }
                        }
                    Text(card.id)
                }
        }
    }
    
    
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

