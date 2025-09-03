//
//  ContentView.swift
//  Memorise
//
//  Created by Varshitha VRaj on 23/08/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var emojis: [String] = ["👀", "🎃", "🕷️", "😈", "🐻", "☠️", "🥳", "😎", "🤭", "👀", "🎃", "🕷️", "😈", "🐻", "☠️", "🥳", "😎", "🤭"]
    
    @State var cardCount: Int = 2
    
    var body: some View {
        ScrollView {
            cardBody
            HStack{
                cardAdder
                Spacer()
                cardRemover
            }
        }
        .padding()
    }
    
    var cardBody: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))] ){
    ForEach(0..<cardCount, id: \.self){ index in
            CardView(content: "\(emojis[index])")
            .aspectRatio(2/3, contentMode: .fit)}
        }
    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: +1, symbol: "plus.app.fill")
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "minus.square.fill")
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
        Button {
            cardCount +=  offset
        } label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset > emojis.count || cardCount + offset < 1 )
    }

}

#Preview {
    ContentView()
}


struct CardView: View{
  
    @State var isFaceUP: Bool = true
    var content: String
    var body: some View {
        
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text("\(content)")
                .font(.largeTitle)
            }
            base.fill()
                .opacity(isFaceUP ? 0 : 1)
        }
        .onTapGesture {
            print("the interface is tapped")
            isFaceUP.toggle()
        }
    }
    
}
