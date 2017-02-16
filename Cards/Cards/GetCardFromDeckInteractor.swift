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
    let manager: DeckOfCardsAPIManager

    public convenience init(deck: Deck) {
        self.init(deck: deck, manager: DeckOfCardsAPIManagerGCDImpl())
    }
    
    public init(deck: Deck, manager: DeckOfCardsAPIManager) {
        self.deck = deck
        self.manager = manager
    }
    
    public func execute(completion: @escaping (Card) -> Void) {
        manager.downloadCard(deck: deck) { (card: Card) in
            assert(Thread.current == Thread.main)
            
            completion(card)
        }
    }
}
