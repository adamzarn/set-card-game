//
//  HideListRowSeparator.swift
//  Set
//
//  Created by Adam Zarn on 10/29/21.
//

import Foundation
import SwiftUI

struct HideListRowSeparator: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content.listRowSeparator(.hidden)
        } else {
            content
        }
    }
}

extension View {
    func hideListRowSeparator() -> some View {
        modifier(HideListRowSeparator())
    }
}
