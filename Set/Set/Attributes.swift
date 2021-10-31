//
//  Attributes.swift
//  Set
//
//  Created by Adam Zarn on 10/31/21.
//

import Foundation
import SwiftUI

enum NumberAttribute: Int {
    case one = 1
    case two = 2
    case three = 3
}

enum ShapeAttribute: String {
    case oval
    case diamond
    case rectangle
}

enum ShadingAttribute: String {
    case none
    case translucent
    case opaque
    
    var fillOpacity: CGFloat {
        switch self {
        case .none: return 0
        case .translucent: return 0.2
        case .opaque: return 1
        }
    }
}

enum ColorAttribute: String {
    case purple
    case green
    case red
    
    var color: Color {
        switch self {
        case .purple: return Color.purple
        case .green: return Color.green
        case .red: return Color.red
        }
    }
}
