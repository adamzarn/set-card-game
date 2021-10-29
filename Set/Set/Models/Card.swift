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
        let description = "\(numberAttribute.rawValue)_" +
                            "\(shapeAttribute.rawValue)_" +
                            "\(shadingAttribute.rawValue)_" +
                            "\(colorAttribute.rawValue)"
        if placeholder {
            return "\(description)_\(UUID().uuidString)"
        }
        return description
    }
    
    let numberAttribute: NumberAttribute
    let shapeAttribute: ShapeAttribute
    let shadingAttribute: ShadingAttribute
    let colorAttribute: ColorAttribute
    
    var selected: Bool
    var inPlay: Bool
    var discarded: Bool
    
    var placeholder: Bool
    
    init(_ numberAttribute: NumberAttribute,
         _ shapeAttribute: ShapeAttribute,
         _ shadingAttribute: ShadingAttribute,
         _ colorAttribute: ColorAttribute,
         _ selected: Bool = false,
         _ inPlay: Bool = false,
         _ discarded: Bool = false,
         _ placeholder: Bool = false) {
        self.numberAttribute = numberAttribute
        self.shapeAttribute = shapeAttribute
        self.shadingAttribute = shadingAttribute
        self.colorAttribute = colorAttribute
        self.selected = selected
        self.inPlay = inPlay
        self.discarded = discarded
        self.placeholder = placeholder
    }
    
    init(placeholder: Bool) {
        self.numberAttribute = .one
        self.shapeAttribute = .diamond
        self.shadingAttribute = .none
        self.colorAttribute = .red
        self.selected = false
        self.inPlay = false
        self.discarded = false
        self.placeholder = placeholder
    }
}
