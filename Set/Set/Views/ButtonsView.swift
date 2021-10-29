//
//  ButtonsView.swift
//  Set
//
//  Created by Adam Zarn on 10/29/21.
//

import Foundation
import SwiftUI

struct ButtonsView: View {
    let allCardsDealt: Bool
    let dealCards: (Int) -> Void
    let reset: () -> Void
    
    var body: some View {
        HStack {
            Button(action: reset, label: {
                Text("Reset")
            }).buttonStyle(CustomButtonStyle())
            Spacer()
            if allCardsDealt {
                Text("All cards have been dealt")
            } else {
                Button(action: { dealCards(3) }, label: {
                    Text("Deal 3 More Cards")
                }).buttonStyle(CustomButtonStyle())
            }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}
