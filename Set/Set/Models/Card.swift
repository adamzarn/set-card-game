//
//  Card.swift
//  Set
//
//  Created by Adam Zarn on 10/28/21.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    var id: String {
        return "\(numberAttribute.rawValue)_\(shapeAttribute.rawValue)_\(shadingAttribute.rawValue)_\(colorAttribute.rawValue)"
    }
    
    let numberAttribute: NumberAttribute
    let shapeAttribute: ShapeAttribute
    let shadingAttribute: ShadingAttribute
    let colorAttribute: ColorAttribute
    
    var selected: Bool
    var inPlay: Bool
    
    init(_ numberAttribute: NumberAttribute,
         _ shapeAttribute: ShapeAttribute,
         _ shadingAttribute: ShadingAttribute,
         _ colorAttribute: ColorAttribute,
         _ selected: Bool = false,
         _ inPlay: Bool = false) {
        self.numberAttribute = numberAttribute
        self.shapeAttribute = shapeAttribute
        self.shadingAttribute = shadingAttribute
        self.colorAttribute = colorAttribute
        self.selected = selected
        self.inPlay = inPlay
    }
}
