import UIKit


class AddEditNoteController: UIViewController {

    var notebook: Notebook!
    
    @IBOutlet weak var noteTitleTextView: UITextField!
    @IBOutlet weak var noteTextTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

   
    @IBAction func saveNoteButtonClicked(_ sender: Any) {
        guard let context = notebook.managedObjectContext else { return }
        
        let note = Note(context: context)
        note.title = self.noteTitleTextView.text
        note.text = self.noteTextTextView.text
        
        // forma primera
        // notebook.notes?.adding(note)
        
        // segunda
        // notebook.addToNotes(note)
        
        // tercera
        note.notebook = notebook
        
        saveContext(context: context)
        
        // popFunctional(nav: self.navigationController)
        popExtended(nav: self.navigationController)
        
    }
    
    

}
