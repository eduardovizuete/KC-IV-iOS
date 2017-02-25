//
//  NotebookCell.swift
//  Everpobre
//
//  Created by Diego Freniche Brito on 21/2/17.
//  Copyright © 2017 freniche. All rights reserved.
//

import UIKit

class NoteCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    private var _note: Note? = nil
    var note: Note {
        get {
            return _note!
        }
        set {
            _note = newValue
            
            titleLabel.text = newValue.title
            textLabel.text = newValue.text
        }
    }
    
}
