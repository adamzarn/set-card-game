//
//  ShadingAttribute.swift
//  Set
//
//  Created by Adam Zarn on 10/28/21.
//

import Foundation
import SwiftUI

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
