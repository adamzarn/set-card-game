//
//  Shape+Extension.swift
//  Set
//
//  Created by Adam Zarn on 10/28/21.
//

import Foundation
import SwiftUI

extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill,
                                                    strokeBorder strokeStyle: Stroke,
                                                    lineWidth: CGFloat,
                                                    fillOpacity: CGFloat) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle).opacity(fillOpacity))
    }
    
    func style(with card: Card) -> some View {
        self.fill(card.colorAttribute.color,
                  strokeBorder: card.colorAttribute.color,
                  lineWidth: 2,
                  fillOpacity: card.shadingAttribute.fillOpacity)
    }
}
