//
//  Notebook+Utils.swift
//  Everpobre
//
//  Created by Diego Freniche Brito on 21/2/17.
//  Copyright © 2017 freniche. All rights reserved.
//

import CoreData

extension Notebook {
    class func fetchRequestOrderedByName() -> NSFetchRequest<Notebook> {
        let fetchRequest: NSFetchRequest<Notebook> = Notebook.fetchRequest()
        fetchRequest.fetchBatchSize = 20
        
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return fetchRequest
    }
}
