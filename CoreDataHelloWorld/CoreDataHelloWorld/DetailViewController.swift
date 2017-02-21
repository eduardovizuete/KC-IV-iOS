//
//  DetailViewController.swift
//  CoreDataHelloWorld
//
//  Created by Diego Freniche Brito on 15/2/17.
//  Copyright © 2017 freniche. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    func configureView() {
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.timestamp!.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        
        let context = detailItem?.managedObjectContext
        let ev = Event(context: context!)
        ev.timestamp = NSDate()
        
        do {
            try context?.save()
        } catch {
            
        }
    }

   
    var detailItem: Event? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

