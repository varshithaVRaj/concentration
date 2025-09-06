//
//  AspectVGrid.swift
//  Memorise
//
//  Created by Varshitha VRaj on 05/09/25.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View{
    
    var items: [Item]
    var aspectRatio: CGFloat = 1
    
    @ViewBuilder var content: (Item) -> ItemView
    //MARK: Create a closure which takes the card as item and gives item view . here again item and item view both are generics, that is why we had to conform both to identifiable protocol.
    
    init(items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
   
    var body: some View {
        GeometryReader{ geometry in
            let gridItemSize = gridItemWidthThatFits(count: items.count, size: geometry.size, atAspectRatio: aspectRatio)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0){
                ForEach(items){ item in
                    content(item)
                    .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
    }
    
    private func gridItemWidthThatFits(
        count: Int,
        size: CGSize,
        atAspectRatio  : CGFloat
    ) -> CGFloat {
        let count = CGFloat(count)
        var columnCount: CGFloat = 1
    
        repeat {
            let width = size.width / columnCount
            let height = width / aspectRatio
            let rowCount = (count / columnCount).rounded(.up)
            
            if rowCount * height < size.height {
                return (size.width / columnCount).rounded(.down)
            }
            
            columnCount += 1
        } while columnCount < count
        
        print("min is : \(max(size.width / count, size.height * aspectRatio).rounded(.down))")
        
        return max(size.width / count, size.height * aspectRatio).rounded(.down)
        
    }
    
}

//#Preview {
//    AspectVGrid<<#Item: Identifiable#>>()
//}
