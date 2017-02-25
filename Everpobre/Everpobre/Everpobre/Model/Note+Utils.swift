//
//  Note+Utils.swift
//  Everpobre
//
//  Created by Diego Freniche Brito on 21/2/17.
//  Copyright © 2017 freniche. All rights reserved.
//

import CoreData

extension Note {
    class func notesFrom(notebook: Notebook) -> NSFetchRequest<Note> {
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        fetchRequest.fetchBatchSize = 20
        
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchRequest.predicate = NSPredicate(format: "notebook == %@", notebook)
        
        return fetchRequest
    }
}
