//
//  ContentViewModel.swift
//  Set
//
//  Created by Adam Zarn on 10/28/21.
//

import Foundation

struct ContentViewModel {
    let cards = [
        Card(.one, .diamond, .none, .red),
        Card(.one, .diamond, .none, .green),
        Card(.one, .diamond, .none, .purple),
        Card(.one, .diamond, .translucent, .red),
        Card(.one, .diamond, .translucent, .green),
        Card(.one, .diamond, .translucent, .purple),
        Card(.one, .diamond, .opaque, .red),
        Card(.one, .diamond, .opaque, .green),
        Card(.one, .diamond, .opaque, .purple),
        Card(.one, .oval, .none, .red),
        Card(.one, .oval, .none, .green),
        Card(.one, .oval, .none, .purple),
        Card(.one, .oval, .translucent, .red),
        Card(.one, .oval, .translucent, .green),
        Card(.one, .oval, .translucent, .purple),
        Card(.one, .oval, .opaque, .red),
        Card(.one, .oval, .opaque, .green),
        Card(.one, .oval, .opaque, .purple),
        Card(.one, .rectangle, .none, .red),
        Card(.one, .rectangle, .none, .green),
        Card(.one, .rectangle, .none, .purple),
        Card(.one, .rectangle, .translucent, .red),
        Card(.one, .rectangle, .translucent, .green),
        Card(.one, .rectangle, .translucent, .purple),
        Card(.one, .rectangle, .opaque, .red),
        Card(.one, .rectangle, .opaque, .green),
        Card(.one, .rectangle, .opaque, .purple),
        Card(.two, .diamond, .none, .red),
        Card(.two, .diamond, .none, .green),
        Card(.two, .diamond, .none, .purple),
        Card(.two, .diamond, .translucent, .red),
        Card(.two, .diamond, .translucent, .green),
        Card(.two, .diamond, .translucent, .purple),
        Card(.two, .diamond, .opaque, .red),
        Card(.two, .diamond, .opaque, .green),
        Card(.two, .diamond, .opaque, .purple),
        Card(.two, .oval, .none, .red),
        Card(.two, .oval, .none, .green),
        Card(.two, .oval, .none, .purple),
        Card(.two, .oval, .translucent, .red),
        Card(.two, .oval, .translucent, .green),
        Card(.two, .oval, .translucent, .purple),
        Card(.two, .oval, .opaque, .red),
        Card(.two, .oval, .opaque, .green),
        Card(.two, .oval, .opaque, .purple),
        Card(.two, .rectangle, .none, .red),
        Card(.two, .rectangle, .none, .green),
        Card(.two, .rectangle, .none, .purple),
        Card(.two, .rectangle, .translucent, .red),
        Card(.two, .rectangle, .translucent, .green),
        Card(.two, .rectangle, .translucent, .purple),
        Card(.two, .rectangle, .opaque, .red),
        Card(.two, .rectangle, .opaque, .green),
        Card(.two, .rectangle, .opaque, .purple),
        Card(.three, .diamond, .none, .red),
        Card(.three, .diamond, .none, .green),
        Card(.three, .diamond, .none, .purple),
        Card(.three, .diamond, .translucent, .red),
        Card(.three, .diamond, .translucent, .green),
        Card(.three, .diamond, .translucent, .purple),
        Card(.three, .diamond, .opaque, .red),
        Card(.three, .diamond, .opaque, .green),
        Card(.three, .diamond, .opaque, .purple),
        Card(.three, .oval, .none, .red),
        Card(.three, .oval, .none, .green),
        Card(.three, .oval, .none, .purple),
        Card(.three, .oval, .translucent, .red),
        Card(.three, .oval, .translucent, .green),
        Card(.three, .oval, .translucent, .purple),
        Card(.three, .oval, .opaque, .red),
        Card(.three, .oval, .opaque, .green),
        Card(.three, .oval, .opaque, .purple),
        Card(.three, .rectangle, .none, .red),
        Card(.three, .rectangle, .none, .green),
        Card(.three, .rectangle, .none, .purple),
        Card(.three, .rectangle, .translucent, .red),
        Card(.three, .rectangle, .translucent, .green),
        Card(.three, .rectangle, .translucent, .purple),
        Card(.three, .rectangle, .opaque, .red),
        Card(.three, .rectangle, .opaque, .green),
        Card(.three, .rectangle, .opaque, .purple),
    ]
    
    var shuffledCards: [Card]
    
    init() {
        self.shuffledCards = cards.shuffled()
    }
    
    var numberOfColumns: Int = 3
    
    var rows: [Row] {
        var rows: [Row] = []
        var id = 1
        for i in stride(from: 0, to: shuffledCards.count, by: numberOfColumns) {
            var rowCards: [Card] = []
            for j in 0..<numberOfColumns {
                if shuffledCards.count > i+j {
                    rowCards.append(shuffledCards[i+j])
                }
            }
            guard rowCards.count > 0 else { continue }
            let row = Row(id: id, cards: rowCards)
            rows.append(row)
            id += 1
        }
        return rows
    }
    
    mutating func toggleSelected(withId id: String) {
        if let index = shuffledCards.firstIndex(where: { $0.id == id }) {
            shuffledCards[index].selected.toggle()
        }
    }
}
