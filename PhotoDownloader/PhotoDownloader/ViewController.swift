import UIKit
class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func downloadBtnClick(_ sender: Any) {
        print("Before download")
        
        let queue = DispatchQueue(label: "myqeue", attributes: .concurrent)
        queue.async {
            self.download()
        }
        
        print("After download")
    }
    
    func download() {
        let urlString = "http://www.castellonaldia.es/wp-content/uploads/2014/01/La-Gioconda-carmen-de-mairena.jpg"
        
        // "https://1.bp.blogspot.com/-9kStPf7CEWo/Vu3ANxcoHpI/AAAAAAAAby4/5hnPeWd6JZQji8XQ9kJcbFprmNgkrMpxA/s640/4.-mona%2BLisa_versus_carmen%2Bde%2BMairena_barrio%2BChino%2BBarcelona_canalla_.jpeg"
        
        let url: URL = NSURL(string: urlString) as! URL
        do {
            let data: Data = try Data(contentsOf: url)
            let img = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.imageView.image = img
            }
        } catch {
            
        }
    }

   
}

