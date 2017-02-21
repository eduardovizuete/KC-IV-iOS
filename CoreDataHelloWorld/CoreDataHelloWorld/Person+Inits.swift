//
//  Person+Inits.swift
//  CoreDataHelloWorld
//
//  Created by Diego Freniche Brito on 20/2/17.
//  Copyright © 2017 freniche. All rights reserved.
//

import CoreData

extension Person {
    public convenience init(context: NSManagedObjectContext, name: String) {
        self.init(context: context)
        
        self.name = name
    }
}
