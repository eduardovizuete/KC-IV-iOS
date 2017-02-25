import UIKit
import CoreData

class NotesController: UIViewController {

    var notebook: Notebook!
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    internal var _fetchedResultsController: NSFetchedResultsController<Note>? = nil
    internal var context: NSManagedObjectContext?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.context = notebook.managedObjectContext
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.title = notebook.title
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "AddNoteSegue" {
                let vc = segue.destination as! AddEditNoteController
                vc.notebook = self.notebook
            }
        }
    }
}
