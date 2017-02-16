//
//  DeckOfCardsAPI.swift
//  Cards
//
//  Created by Diego Freniche Brito on 14/2/17.
//  Copyright © 2017 freniche. All rights reserved.
//

import UIKit

public class DeckOfCardsAPIManagerFakeImpl: DeckOfCardsAPIManager {
    
    public func downloadDeck(completion: @escaping (Deck) -> Void) {
        self.downloadDeck(completion: completion, onError: nil)
    }
    
    public func downloadDeck(completion: @escaping (Deck) -> Void, onError: ErrorClosure? = nil) {
        let deck = Deck(deckId: "4832")
        completion(deck)
    }
    
    public func downloadCard(deck: Deck, completion: @escaping (Card) -> Void) {
        let card = Card(code: "code", suit: "bastos", image: "http://")
        completion(card)
    }
    
    public func downloadCardImage(card: Card, completion: @escaping (UIImage) -> Void) {
        let image = UIImage(named: "card")
        completion(image!)
    }
}
