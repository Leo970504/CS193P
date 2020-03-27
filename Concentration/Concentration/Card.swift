//
//  Card.swift
//  Concentration
//
//  Created by 蔡思祺 on 2020/3/26.
//  Copyright © 2020 CS193P. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIndentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIndentifier()
    }
}

