//
//  Cardify.swift
//  Memorise
//
//  Created by Varshitha VRaj on 06/09/25.
//

import Foundation
import SwiftUICore

struct Cardify: ViewModifier, Animatable{
    
    init(isFaceUp: Bool) {
        self.rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUP: Bool{
        rotation < 90
    }
    
    
    var rotation: Double
    
    var animatableData: Double{
        get{ return rotation }
        set{   rotation = newValue }
    }
    
    
    
    func body(content: Content) -> some View {
        
        ZStack{
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            base.fill(.white)
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFaceUP ? 1 : 0)
            base.fill()
                .opacity(isFaceUP ? 0 : 1)
        }
        
        .rotation3DEffect(.degrees(rotation), axis: (0,1,0))
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
