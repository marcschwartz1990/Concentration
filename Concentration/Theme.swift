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
            return Theme(content: ["ðĐïļ", "ðŧ", "ð", "ð", "ðĩ", "ð", "ðĪ", "ð", "ðïļ"], backGroundColor: UIColor.systemYellow, cardColor: UIColor.systemGray)
        case .halloween:
            return Theme(content: ["ð", "ðŧ", "ðš", "ðŦĨ", "ð", "ð―", "ð§ââïļ", "ðĶļðŋââïļ", "ðđ"], backGroundColor: UIColor.black, cardColor: UIColor.systemOrange)
        case .faces:
            return Theme(content: ["ð§", "ðĄ", "ð", "ðĪŊ", "ðĪŠ", "ðĨģ", "âđïļ", "ðŦĢ", "ðĪ "], backGroundColor: UIColor.systemYellow, cardColor: UIColor.black)
        case .flags:
            return Theme(content: ["ð", "ðīââ ïļ", "ðģïļâð", "ðĻðĶ", "ðĻðģ", "ðŦðŪ", "ðŊðĩ", "ðŽð§", "ðšðļ"], backGroundColor: UIColor.systemPurple, cardColor: UIColor.systemMint)
        case .animals:
            return Theme(content: ["ð", "ð°", "ðķ", "ðĶ", "ðĶ", "ðĶ", "ð", "ð", "ðĶ"], backGroundColor: UIColor.systemGreen, cardColor: UIColor.systemPurple)
        case .food:
            return Theme(content: ["ð", "ð", "ðĨĻ", "ðĨ", "ðŦ", "ðĨ", "ð", "ð­", "ðĨ"], backGroundColor: UIColor.systemCyan, cardColor: UIColor.systemPink)
        }
    }
}


