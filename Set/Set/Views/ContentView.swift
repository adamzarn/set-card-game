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
        List {
            ForEach(viewModel.rows, id: \.id) { row in
                RowView(cards: row.cards, onTapCard: { id in
                    viewModel.removeCard(withId: id)
                }).hideListRowSeparator()
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
