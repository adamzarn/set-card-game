//
//  RowView.swift
//  Set
//
//  Created by Adam Zarn on 10/29/21.
//

import Foundation
import SwiftUI

struct RowView: View {
    let cards: [Card]
    let onTapCard: (String) -> Void
    
    var body: some View {
        HStack {
            ForEach(cards, id: \.id) { card in
                CardView(card: card, onTapGesture: {
                    onTapCard(card.id)
                })
                .opacity(card.placeholder ? 0 : 1)
                .aspectRatio(1.4, contentMode: .fit)
            }
        }
    }
}
