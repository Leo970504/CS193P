//
//  Concentration.swift
//  Concentration
//
//  Created by 蔡思祺 on 2020/3/26.
//  Copyright © 2020 CS193P. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[index].identifier == cards[matchIndex].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
        for _ in 0..<cards.count {
            let i = Int(arc4random_uniform(UInt32(cards.count - 1)))
            let j = Int(arc4random_uniform(UInt32(cards.count - 1)))
            let tempCard = cards[i]
            cards[i] = cards[j]
            cards[j] = tempCard
        }
    }
}
