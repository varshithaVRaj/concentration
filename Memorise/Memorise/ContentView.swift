//
//  ContentView.swift
//  Memorise
//
//  Created by Varshitha VRaj on 23/08/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var emojis: [String] = ["👀", "🎃", "🕷️", "😈", "🐻"]
    
    var body: some View {
        HStack(content: {
            
            ForEach(emojis.indices){ index in
                CardView(content: "\(emojis[index])")
            }
            
        })
    }
    
}
#Preview {
    ContentView()
}


struct CardView: View{
  
    @State var isFaceUP: Bool = false
    
    var content: String
    
    var body: some View {
        
        ZStack{
            
//            let base = RoundedRectangle(cornerRadius: 10)
            let base = Circle()
            
            if isFaceUP{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                
                Text("\(content)")
                .font(.largeTitle)
                
            }else{
                base.fill()
                .foregroundColor(.orange)
                base.strokeBorder(lineWidth: 2)
                
            }
        }
        .onTapGesture {
            print("the interface is tapped")
            isFaceUP.toggle()
        }
    }
    
}
