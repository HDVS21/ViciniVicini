//
//  CardCarousel.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 11/3/25.
//

import SwiftUI

struct CardCarousel: View {
    
    let cards: [Card]
    
    @State private var currentCard: String = ""
    @State private var fakedCards: [Card] = []
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            VStack {
                TabView(selection: $currentCard) {
                    ForEach(fakedCards) { card in
                        Image(card.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 260, height: 156)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .tag(card.id.uuidString)
                            .offsetX(currentCard == card.id.uuidString) { rect in
                                let minX = rect.minX
                                let cardOffset = minX - (size.width * CGFloat(fakeIndex(card)))
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
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                PageControl(totalCards: cards.count, currentCard: originalIndex(currentCard))
            }
        }
        .frame(height: 180)
        .onAppear {
            setupFakedCards()
        }
    }
    
    private func setupFakedCards() {
        guard fakedCards.isEmpty else { return }
        
        fakedCards = cards
        
        if var firstCard = cards.first, var lastCard = cards.last {
            currentCard = firstCard.id.uuidString
            
            firstCard.id = UUID()
            lastCard.id = UUID()
            
            fakedCards.append(firstCard)
            fakedCards.insert(lastCard, at: 0)
        }
    }
    
    func fakeIndex(_ of: Card) -> Int {
        return fakedCards.firstIndex(of: of) ?? 0
    }
    
    func originalIndex(_ id: String) -> Int {
        return cards.firstIndex { card in
            card.id.uuidString == id
        } ?? 0
    }
}

//#Preview {
//    CardCarousel(cards: <#[Card]#>)
//}
