import UIKit
import CoreData

class AddEditNotebookController: UIViewController {

    var context: NSManagedObjectContext?
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var notebookNameTextField: UITextField!
    

    @IBOutlet weak var topBackgroundConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.backgroundView.layer.cornerRadius = 10.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2.0, animations: { 
            self.backgroundView.frame = CGRect(x: self.backgroundView.frame.origin.x , y: 15, width: self.backgroundView.frame.width, height: self.backgroundView.frame.size.height)
            self.backgroundView.backgroundColor = UIColor.red
        }) { (b: Bool) in
            self.topBackgroundConstraint.constant = 15.0
        }
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
