//
//  ShapeView.swift
//  Set
//
//  Created by Adam Zarn on 10/28/21.
//

import Foundation
import SwiftUI

struct ShapeView: View {
    var card: Card
    
    var body: some View {
        switch card.shapeAttribute {
        case .diamond: Diamond().style(with: card)
        case .oval: Capsule().style(with: card)
        case .rectangle: Rectangle().style(with: card)
        }
    }
}
