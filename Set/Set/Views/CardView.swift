//
//  CardView.swift
//  Set
//
//  Created by Adam Zarn on 10/28/21.
//

import Foundation
import SwiftUI

struct CardView: View {
    var card: Card
    let onTapGesture: () -> Void
    
    var borderColor: Color {
        return card.selected ? Color.blue : Color.gray
    }
    
    var borderWidth: CGFloat {
        return card.selected ? 4 : 1
    }
    
    var padding: CGFloat {
        return 8
    }
    
    var spacing: CGFloat {
        return 8
    }
    
    func twoShapeOffset(width: CGFloat) -> CGSize {
        let availableShapeWidth = width - 2*padding - 2*spacing
        let shapeWidth = availableShapeWidth/3
        let shift = (shapeWidth + spacing) / 2
        return CGSize(width: shift, height: 0)
    }
    
    func firstOffset(width: CGFloat) -> CGSize {
        switch card.numberAttribute {
        case .one: return CGSize.zero
        case .two: return twoShapeOffset(width: width)
        case .three: return CGSize.zero
        }
    }
    
    func secondOffset(width: CGFloat) -> CGSize {
        switch card.numberAttribute {
        case .one: return CGSize.zero
        case .two: return twoShapeOffset(width: width)
        case .three: return CGSize.zero
        }
    }
    
    var firstOpacity: CGFloat {
        switch card.numberAttribute {
        case .one: return 0
        case .two: return 1
        case .three: return 1
        }
    }
    
    var secondOpacity: CGFloat {
        return 1
    }
    
    var thirdOpacity: CGFloat {
        switch card.numberAttribute {
        case .one: return 0
        case .two: return 0
        case .three: return 1
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: spacing) {
                ShapeView(card: card)
                    .offset(firstOffset(width: geometry.size.width))
                    .opacity(firstOpacity)
                ShapeView(card: card)
                    .offset(firstOffset(width: geometry.size.width))
                    .opacity(secondOpacity)
                ShapeView(card: card)
                    .opacity(thirdOpacity)
            }
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: onTapGesture)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(card: Card(.one, .diamond, .none, .purple), onTapGesture: {})
                .previewLayout(.fixed(width: 200, height: 120))
        }
    }
}
