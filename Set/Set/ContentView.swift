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
                    })
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

struct CardView: View {
    var card: Card
    let onTapGesture: () -> Void
    
    var borderColor: Color {
        return card.selected ? Color.blue : Color.gray
    }
    
    var borderWidth: CGFloat {
        return card.selected ? 4 : 1
    }
    
    var padding: CGFloat {
        return 8
    }
    
    var spacing: CGFloat {
        return 8
    }
    
    func twoShapeOffset(width: CGFloat) -> CGSize {
        let availableShapeWidth = width - 2*padding - 2*spacing
        let shapeWidth = availableShapeWidth/3
        let shift = (shapeWidth + spacing) / 2
        return CGSize(width: shift, height: 0)
    }
    
    func firstOffset(width: CGFloat) -> CGSize {
        switch card.numberAttribute {
        case .one: return CGSize.zero
        case .two: return twoShapeOffset(width: width)
        case .three: return CGSize.zero
        }
    }
    
    func secondOffset(width: CGFloat) -> CGSize {
        switch card.numberAttribute {
        case .one: return CGSize.zero
        case .two: return twoShapeOffset(width: width)
        case .three: return CGSize.zero
        }
    }
    
    var firstOpacity: CGFloat {
        switch card.numberAttribute {
        case .one: return 0
        case .two: return 1
        case .three: return 1
        }
    }
    
    var secondOpacity: CGFloat {
        return 1
    }
    
    var thirdOpacity: CGFloat {
        switch card.numberAttribute {
        case .one: return 0
        case .two: return 0
        case .three: return 1
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: spacing) {
                ShapeView(card: card)
                    .offset(firstOffset(width: geometry.size.width))
                    .opacity(Double(firstOpacity))
                ShapeView(card: card)
                    .offset(firstOffset(width: geometry.size.width))
                    .opacity(Double(secondOpacity))
                ShapeView(card: card)
                    .opacity(Double(thirdOpacity))
            }
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: onTapGesture)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(card: Card(.one, .diamond, .none, .purple), onTapGesture: {})
                .previewLayout(.fixed(width: 200, height: 120))
        }
    }
}

struct ShapeView: View {
    var card: Card
    
    var body: some View {
        switch card.shapeAttribute {
        case .diamond: Diamond().style(with: card)
        case .oval: Capsule().style(with: card)
        case .rectangle: Rectangle().style(with: card)
        }
    }
}
