//
//  CardView.swift
//  Memorise
//
//  Created by Varshitha VRaj on 05/09/25.
//

import SwiftUI

struct CardView: View{
    
    let card: MemoryGame<String>.Card
    typealias Card = MemoryGame<String>.Card
    
    init(card: Card){
        self.card = card
    }
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group{
                
                base.fill(.white)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                
                Pie(endAngle: .degrees(240))
                    .stroke(lineWidth: 2)
                    .opacity(Constants.Pie.opacity)

                    .overlay{
                        Text(card.content)
                            .font(.system(size: Constants.FontSize.largest))
                            .minimumScaleFactor(Constants.FontSize.scaleFactor )
                            .multilineTextAlignment(.center)
                            .aspectRatio(1, contentMode: .fit)
                            .padding(Constants.inset)
                    }
            }
            .opacity(card.isFaceUP ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUP ? 0 : 1)
        }
        .opacity(card.isFaceUP || !card.isMatched ? 1 : 0)
    }
    
    
    private struct Constants{
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        
        struct FontSize{
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        
        struct Pie{
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5

        }
    }
    
    
}

#Preview {
    
    HStack{
        CardView(card: MemoryGame<String>.Card(id: "test 1", isFaceUP: false, content: "X"))
        CardView(card: MemoryGame<String>.Card(id: "test 1", isFaceUP: false, content: "X"))
    }
    .padding()
    .foregroundColor(Color.green)
    
    HStack{
        CardView(card: MemoryGame<String>.Card(id: "test 1", isFaceUP: true, content: "X"))
        CardView(card: MemoryGame<String>.Card(id: "test 1", isFaceUP: true, content: "X"))
    }
    .padding()
    .foregroundColor(Color.green)
}
