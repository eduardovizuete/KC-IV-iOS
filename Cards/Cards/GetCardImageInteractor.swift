//
//  GetCardImageInteractor.swift
//  Cards
//
//  Created by Diego Freniche Brito on 15/2/17.
//  Copyright © 2017 freniche. All rights reserved.
//

import UIKit

public class GetCardImageInteractor {
    let card: Card
    let manager: DeckOfCardsAPIManager

    public convenience init(card: Card) {
        self.init(card: card, manager: DeckOfCardsAPIManagerGCDImpl())
    }
    
    public init(card: Card, manager: DeckOfCardsAPIManager) {
        self.card = card
        self.manager = manager
    }
    
    public func execute(completion: @escaping (UIImage) -> Void) {
        manager.downloadCardImage(card: self.card) { (image: UIImage) in
            assert(Thread.current == Thread.main)
            
            completion(image)
        }
    }   
}
