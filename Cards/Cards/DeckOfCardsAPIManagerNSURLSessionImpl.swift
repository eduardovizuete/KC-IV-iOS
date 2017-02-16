//
//  DeckOfCardsAPI.swift
//  Cards
//
//  Created by Diego Freniche Brito on 14/2/17.
//  Copyright © 2017 freniche. All rights reserved.
//

import UIKit

public class DeckOfCardsAPIManagerNSURLSessionImpl: DeckOfCardsAPIManager {
    
    public func downloadDeck(completion: @escaping (Deck) -> Void) {
        self.downloadDeck(completion: completion, onError: nil)
    }
    
    public func downloadDeck(completion: @escaping (Deck) -> Void, onError: ErrorClosure? = nil) {
        let urlString = "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            
            let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                if let error = error, let errorClosure = onError {
                    errorClosure(error)
                    return;
                }
                
                do {
                    if let data = data {
                        let deckJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
                        
                        let deck = Deck(deckId: deckJson["deck_id"] as! String)
                        DispatchQueue.main.async {
                            completion(deck)
                        }
                    }
                } catch {
                    print("Error in downloadDeck " + error.localizedDescription)
                    if let errorClosure = onError {
                        errorClosure(error)
                    }
                }
            })
        
            task.resume()
        }
    }
    
    public func downloadCard(deck: Deck, completion: @escaping (Card) -> Void) {
        let urlString = "https://deckofcardsapi.com/api/deck/\( deck.deckId )/draw/?count=1"
        
        let queue = OperationQueue()
        queue.addOperation {
            if let url = URL(string: urlString) {
                do {
                    let data = try Data(contentsOf: url)
                    let cardJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
                    
                    let cards = cardJson["cards"] as! [Dictionary<String, Any>]
                    
                    let firstCard = cards[0]
                    
                    let card = Card(code: firstCard["code"] as! String, suit: firstCard["suit"] as! String, image: firstCard["image"] as! String)
                    
                    OperationQueue.main.addOperation {
                        completion(card)
                    }
                } catch {
                    print("Error in downloadDeck " + error.localizedDescription)
                }
            }
        }
    }
    
    public func downloadCardImage(card: Card, completion: @escaping (UIImage) -> Void) {
        let queue = OperationQueue()
        queue.addOperation {
            if let url = URL(string: card.image) {
                do {
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    
                    OperationQueue.main.addOperation {
                        completion(image!)
                    }
                } catch {
                    print("Error in downloadCardImage " + error.localizedDescription)
                }
            }
        }
    }
}
