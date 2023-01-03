//
//  Card.swift
//  Concentration
//
//  Created by Marc-Developer on 1/1/23.
//

import Foundation

struct Card: Equatable {
//    The card is UI independent. Information about what is on the card is not necessary.
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
