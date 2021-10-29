//
//  ContentView.swift
//  Set
//
//  Created by Adam Zarn on 10/28/21.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.rows, id: \.id) { row in
                    RowView(cards: row.cards, onTapCard: { id in
                        viewModel.toggleSelected(withId: id)
                    }).hideListRowSeparator()
                }
            }
            .listStyle(PlainListStyle())
            ButtonsView(allCardsDealt: viewModel.allCardsDealt,
                        dealCards: dealCards,
                        reset: reset)
        }
    }
    
    func dealCards(number: Int) {
        viewModel.dealCards(number: number)
    }
    
    func reset() {
        viewModel = ContentViewModel()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
