//
//  Concentration.swift
//  Concentration
//
//  Created by Marc-Developer on 1/1/23.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    var theme = ThemeChoice.allCases.randomElement()!
    var score = 0
    private var seenCardIndicies = [Int]()
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set(newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    var flipCount = 0
    private var timeFirstCardPressed: Date?
    private var timeSecondCardPressed: Date?
    
    // TODO: Refactor chooseCard to smaller functions.
    // TODO: When card that is already faceup is tapped, nothing should happen.
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
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
                
            } else {
                if timeFirstCardPressed != nil && timeSecondCardPressed != nil {
                    timeFirstCardPressed = nil
                    timeSecondCardPressed = nil
                }
                // either no cards or 2 cards are face up
                timeFirstCardPressed = Date.now
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
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
