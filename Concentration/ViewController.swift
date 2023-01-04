//
//  ViewController.swift
//  Concentration
//
//  Created by Marc-Developer on 12/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2, theme: ThemeChoice.allCases.randomElement()!)
//    var game is the "green arrow" to the model. Through this var, I can interact with the Model's public API.

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("button not in cardButtons")
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        // Create new Concentration model and refresh View.
        self.game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2, theme: ThemeChoice.allCases.randomElement()!)
        updateViewFromModel()
        // Reset emojiChoices and emoji vars
        emojiChoices = game.theme.chosenTheme.content
        emoji = [Int:String]()
        
    }
    
    func updateViewFromModel() {
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
    
    lazy var emojiChoices = game.theme.chosenTheme.content
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            if emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        return emoji[card.identifier] ?? "?"
    }
}

