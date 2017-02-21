import UIKit
import CoreData

class NotebooksController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var context: NSManagedObjectContext?
    var _fetchedResultsController: NSFetchedResultsController<Notebook>? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "AddEditNotebookSegue" {
                let vc = segue.destination as! AddEditNotebookController
                vc.context = self.context
            }
            
            if identifier == "AboutSegue" {
                // nothing to do
            }
            
            if identifier == "NotesSegue" {
                let indexPath = collectionView.indexPathsForSelectedItems?.first
                let notebook = fetchedResultsController.object(at: indexPath!)
                let vc = segue.destination as! AddEditNotebookController
                notebook.notes
            }
        }
    }

}

