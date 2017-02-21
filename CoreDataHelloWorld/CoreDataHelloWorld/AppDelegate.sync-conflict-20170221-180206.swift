import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
    
    var window: UIWindow?
    let coreDataManager = CoreDataManager()
    var context: NSManagedObjectContext?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self

        let masterNavigationController = splitViewController.viewControllers[0] as! UINavigationController
        let controller = masterNavigationController.topViewController as! MasterViewController
        
        
        
        // Persistent Container
        let persistentContainer: NSPersistentContainer = self.coreDataManager.persistentContainer(dbName: "CoreDataHelloWorld")
        
        // Persistent Store: BBDD
        
        // Persistent Store Coordinator
        let persistentStoreCoordinator: NSPersistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        
        // Context
        self.context = persistentContainer.viewContext

        // object model
        persistentContainer.managedObjectModel
        
        
        testZone()
        
        controller.managedObjectContext = self.context

        
        return true
    }

    
    func applicationWillTerminate(_ application: UIApplication) {
        self.coreDataManager.saveContext(context: self.context!)
    }

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }
   
    func testZone() {
        let ev1 = Event(context: self.context!)
        ev1.timestamp = NSDate()
        
        let ev2 = Event(context: self.context!)
        ev2.timestamp = NSDate()

        
        let diego: Person = Person(context: self.context!)
        diego.name = "Adiós"
        diego.address = "This wednesday"
        diego.married = true
        diego.happy = true
        
        let marujita = Person(context: self.context!, name: "Marujita Díaz")
        
        print("❤️  \(self.context!.insertedObjects.count)")
        
        self.coreDataManager.saveContext(context: self.context!)
        
        self.context!.delete(marujita) // marcamos marujita
        print("*** --> 😇 \(marujita.isDeleted)")
        self.coreDataManager.saveContext(context: self.context!)

        diego.happy = false
        diego.address = "Under a bridge"
        
        print(" 🍅  Changes  \(self.context!.hasChanges) ")
        
        // fetch: consultar objetos gestionados en un contexto
        
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        _ = NSFetchRequest<Person>(entityName: "Person")
        
        fetchRequest.fetchBatchSize = 10
        
        let orderByName = NSSortDescriptor(key: "name", ascending: true)
        let orderByAddress = NSSortDescriptor(key: "address", ascending: true)
        
        fetchRequest.sortDescriptors = [orderByName, orderByAddress]
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true),
                                        NSSortDescriptor(key: "address", ascending: true)]

        do {
            let result = try self.context!.fetch(fetchRequest)
            print("Num records \(result.count)")
            
            for p in result {
                print("Name \(p.name), address \(p.address)")
            }
            
        } catch {
            
        }
        
        
        
    }
    
}

