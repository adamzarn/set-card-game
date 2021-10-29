//
//  CustomButtonStyle.swift
//  Set
//
//  Created by Adam Zarn on 10/29/21.
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
