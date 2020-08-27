//
//  Constants.swift
//  Cheff
//
//  Created by Joga Singh on 28/08/20.
//  Copyright © 2020 Joga Singh. All rights reserved.
//

import UIKit

struct ReviewData {
    let title: ReviewTitle
    let description: ReviewDescription
}

enum Assets: String {
    case starSelected = "starSelected"
    case starUnselected = "starUnselected"
    case user = "user"
    func image() -> UIImage? {
        return UIImage.init(named: self.rawValue)
    }
}

enum vcIdentifier: String {
    case tipVC = "TipViewController"
    
    var value: String {
        return self.rawValue
    }
}

enum ReviewTitle : String {
    case bad = "Bad"
    case average = "Average"
    case good = "Good"
    case lovedIt = "Loved it"
    var value: String {
        return self.rawValue
    }
}

enum ReviewDescription : String {
    case wrong = "What went wrong?"
    case improve = "What can the chef improve?"
    case impress = "What did the chef impress you with?"
    var value: String {
        return self.rawValue
    }
}

enum Titles: String {
    case ok = "OK"
    case thankYou = "Thank you"
    
    var value: String {
        return self.rawValue
    }
}
