//
//  Pie.swift
//  Memorise
//
//  Created by Varshitha VRaj on 06/09/25.
//


import SwiftUI
import CoreGraphics

struct Pie: Shape{
    
    var startAngle: Angle = .zero
    let endAngle: Angle
    var clockwise = true
    
    func path(in rect: CGRect) -> Path {
        
        let startAngle = startAngle - .degrees(90)
        let endAngle = endAngle - .degrees(90 )
        

        //MARK: the centre of the cirle is the mid of the rectangle
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        //MARK: the radius is half of either the width or the height
        let radius = min(rect.width, rect.height) / 2
        
        print("the start angle radians is \(startAngle.radians)")
        
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians), //MARK: tells us where to go in a horizontal direction
            y: center.y + radius * sin(startAngle.radians) //MARK: tells vertically where to go
        )
        
        var p = Path()
        
        //MARK: we are moving p to the centre
        p.move(to: center)
        
        //MARK: we need to tell how far we should move from centre to to the start point
        
        p.addLine(to: start)
        
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise:
                    !clockwise)
        
        p.addLine(to: center)
        
        return p
    }
    

}


