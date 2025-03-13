//
//  CardCarousel.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 11/3/25.
//

import SwiftUI

struct CardCarousel: View {
    
    @State private var currentCard: String = ""
    @State private var listOfCards: [Card] = []
    
    @State private var fakedCards: [Card] = []
    var body: some View {
        GeometryReader {
            let size = $0.size
            VStack {
                TabView(selection: $currentCard, content: {
                    ForEach(fakedCards) { Card in
                        Rectangle()
                            .fill(Card.color)
                            .cornerRadius(16)
                            .frame(width: 200, height: 240)
                            .tag(Card.id.uuidString)
                            .offsetX(currentCard == Card.id.uuidString) { rect in
                                let minX = rect.minX
                                let cardOffset = minX - (size.width * CGFloat(fakeIndex(Card)))
                                let cardProgress = cardOffset / size.width
                                
                                if -cardProgress < 1.0 {
                                    if fakedCards.indices.contains(fakedCards.count - 1) {
                                        currentCard = fakedCards[fakedCards.count - 1].id.uuidString
                                    }
                                }
                                
                                if -cardProgress > CGFloat(fakedCards.count - 1) {
                                    if fakedCards.indices.contains(1) {
                                        currentCard = fakedCards[1].id.uuidString
                                    }
                                }
                            }
                    }
                })
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                PageControl(totalCards: listOfCards.count, currentCard: originalIndex(currentCard))
            }
            
        }
        .frame(height: 300)
        
        .onAppear {
            guard fakedCards.isEmpty else { return }
            for color in [Color.blue, Color.blue, Color.blue, Color.blue, Color.blue] {
                listOfCards.append(.init(color: color))
            }
            
            fakedCards.append(contentsOf: listOfCards)
            
            if var firstCard = listOfCards.first, var lastCard = listOfCards.last {
                currentCard = firstCard.id.uuidString
                
                firstCard.id = .init()
                lastCard.id = .init()
                
                fakedCards.append(firstCard)
                fakedCards.insert(lastCard, at: 0)
            }
        }
    }
    
    func fakeIndex(_ of: Card) -> Int {
        return fakedCards.firstIndex(of: of) ?? 0
    }
    
    func originalIndex(_ id: String) -> Int {
        return listOfCards.firstIndex { card in
            card.id.uuidString == id
        } ?? 0
    }
}

#Preview {
    CardCarousel()
}
