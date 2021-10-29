//
//  ColorAttribute.swift
//  Set
//
//  Created by Adam Zarn on 10/28/21.
//

import Foundation
import SwiftUI

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
