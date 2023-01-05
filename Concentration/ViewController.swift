//
//  ViewController.swift
//  Concentration
//
//  Created by Marc-Developer on 12/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
//    private var theme: ThemeChoice {
//        ThemeChoice.allCases.randomElement()!
//    }
//    var game is the "green arrow" to the model. Through this var, I can interact with the Model's public API.

    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("button not in cardButtons")
        }
    }
    
    @IBAction private func newGame(_ sender: UIButton) {
        // Create new Concentration model and refresh View.
        self.game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        updateViewFromModel()
        // Reset emojiChoices and emoji vars
        emojiChoices = game.theme.chosenTheme.content
        emoji = [Int:String]()
        
    }
    
    private func updateViewFromModel() {
        view.backgroundColor = game.theme.chosenTheme.backGroundColor
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : game.theme.chosenTheme.cardColor
            }
        }
        scoreLabel.text = "Score: \(game.score)"
        flipCountLabel.text = "Flips: \(game.flipCount)"
    }
    
    // TODO: Create themes. var emojiChoices will be from a selected theme. Use an enum?
    
    // emoji
    
    private lazy var emojiChoices = game.theme.chosenTheme.content
    
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            if emojiChoices.count > 0 {
                emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
            }
        }
        return emoji[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}

