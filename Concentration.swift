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
    var timeFirstCardPressed: Date?
    var timeSecondCardPressed: Date?
    
    // TODO: Refactor chooseCard to smaller functions.
    // TODO: When card that is already faceup is tapped, nothing should happen.
    
    func chooseCard(at index: Int) {
        var isNewCard = false
        // add card index to seenCardIndicies
        if !seenCardIndicies.contains(index) {
            seenCardIndicies.append(index)
            isNewCard = true
        }

        if !cards[index].isMatched && !cards[index].isFaceUp {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match (one card is up and the chosen card is compared to it)
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                    timeSecondCardPressed = Date()
                    addTimeBonus()
                } else {
                    if !isNewCard {
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            } else {
                if timeFirstCardPressed != nil && timeSecondCardPressed != nil {
                    timeFirstCardPressed = nil
                    timeSecondCardPressed = nil
                }
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                timeFirstCardPressed = Date.now
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            flipCount += 1
        }
    }
    
    private func addTimeBonus() {
        if timeFirstCardPressed != nil && timeSecondCardPressed != nil {
            let timeDifference = timeFirstCardPressed!.distance(to: timeSecondCardPressed!)
            if timeDifference > 2 && timeDifference < 3 {
                score += 1
            } else if timeDifference > 1 && timeDifference < 2 {
                score += 2
            } else if timeDifference > 0 && timeDifference < 1 {
                score += 3
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
