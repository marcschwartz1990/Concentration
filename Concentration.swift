//
//  Concentration.swift
//  Concentration
//
//  Created by Marc-Developer on 1/1/23.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var theme: ThemeChoice
    var score = 0
    var seenCardIndicies = [Int]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    var flipCount = 0
    
    func chooseCard(at index: Int) {
        var isNewCard = false
        
        if !seenCardIndicies.contains(index) {
            seenCardIndicies.append(index)
            isNewCard = true
        }
        // TODO: Scoring
        // Cards are not unique. Card Identifiers are doubled. How can I identify which CARD is clicked. Maybe cardButton Index?

        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    if !isNewCard {
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, theme: ThemeChoice) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
        self.theme = theme
    }
}
