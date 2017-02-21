import UIKit
import CoreData

class AddEditNotebookController: UIViewController {

    var context: NSManagedObjectContext?
    
    @IBOutlet weak var notebookNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        guard let context = self.context else { return }
        
        let notebook = Notebook(context: context)
        notebook.creationDate = NSDate()
        notebook.title = self.notebookNameTextField.text
        
        saveContext(context: context)
        
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
}
