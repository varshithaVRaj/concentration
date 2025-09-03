//
//  ContentView.swift
//  Memorise
//
//  Created by Varshitha VRaj on 23/08/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        HStack(content: {
            
            CardView(isFaceUP: true)
            CardView()
            CardView()
            CardView()
            
        })
    }
    
}
#Preview {
    ContentView()
}


struct CardView: View{
  
    @State var isFaceUP: Bool = false
    
    var body: some View {
        
        ZStack{
            
//            let base = RoundedRectangle(cornerRadius: 10)
            let base = Circle()
            
            if isFaceUP{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                
                Text("👀")
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
