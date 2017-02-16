//
//  DeckInteractor.swift
//  Cards
//
//  Created by Diego Freniche Brito on 14/2/17.
//  Copyright © 2017 freniche. All rights reserved.
//

import Foundation

public class DeckInteractor {
    let manager: DeckOfCardsAPIManager
    
    public init(manager: DeckOfCardsAPIManager) {
        self.manager = manager
    }
    
    public convenience init() {
        self.init(manager: DeckOfCardsAPIManagerGCDImpl())
    }
    
    public func execute(completion: @escaping (Deck) -> Void) {
        manager.downloadDeck(completion: { (deck: Deck) in
            assert(Thread.current == Thread.main)
            
            completion(deck)
        })
    }
}
