//
//  GetCardFromDeckInteractor.swift
//  Cards
//
//  Created by Diego Freniche Brito on 14/2/17.
//  Copyright © 2017 freniche. All rights reserved.
//

import Foundation

public class GetCardFromDeckInteractor {
    let deck: Deck
    
    public init(deck: Deck) {
        self.deck = deck
    }
    
    public func execute(completion: @escaping (Card) -> Void) {
        DeckOfCardsAPIManager().downloadCard(deck: deck) { (card: Card) in
            assert(Thread.current == Thread.main)
            
            completion(card)
        }
    }
}
