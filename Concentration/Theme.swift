//
//  Theme.swift
//  Concentration
//
//  Created by Marc-Developer on 1/2/23.
//

import Foundation
import UIKit

struct Theme {
    let content: [String]
    let backGroundColor: UIColor
    let cardColor: UIColor
}

enum ThemeChoice: CaseIterable {
    case vehicles
    case halloween
    case faces
    case flags
    case animals
    case food
    
    var chosenTheme: Theme {
        switch self {
        case .vehicles:
            return Theme(content: ["🛩️", "🛻", "🚒", "🚁", "🛵", "🚃", "🚤", "🚀", "🏎️"], backGroundColor: UIColor.systemYellow, cardColor: UIColor.systemGray)
        case .halloween:
            return Theme(content: ["🎃", "👻", "👺", "🫥", "💀", "👽", "🧟‍♂️", "🦸🏿‍♀️", "👹"], backGroundColor: UIColor.black, cardColor: UIColor.systemOrange)
        case .faces:
            return Theme(content: ["🧐", "😡", "😎", "🤯", "🤪", "🥳", "☹️", "🫣", "🤠"], backGroundColor: UIColor.systemYellow, cardColor: UIColor.black)
        case .flags:
            return Theme(content: ["🏁", "🏴‍☠️", "🏳️‍🌈", "🇨🇦", "🇨🇳", "🇫🇮", "🇯🇵", "🇬🇧", "🇺🇸"], backGroundColor: UIColor.systemPurple, cardColor: UIColor.systemMint)
        case .animals:
            return Theme(content: ["🐒", "🐰", "🐶", "🦉", "🦆", "🦄", "🐍", "🐙", "🦈"], backGroundColor: UIColor.systemGreen, cardColor: UIColor.systemPurple)
        case .food:
            return Theme(content: ["🍌", "🍎", "🥨", "🥚", "🫒", "🥑", "🍕", "🌭", "🥞"], backGroundColor: UIColor.systemCyan, cardColor: UIColor.systemPink)
        }
    }
}


