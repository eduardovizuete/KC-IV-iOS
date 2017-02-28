import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var locationManager: CLLocationManager?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        locationManager?.startUpdatingLocation()
        
        mapView.delegate = self
        
        let a1 = MapPin(coordinate: CLLocationCoordinate2D(latitude: 51.509865, longitude: -0.1180))
        a1.title = "Pin 1"
        a1.subtitle = "Subtitle 1"
        
        self.mapView.addAnnotation(a1)
        
        let a2 = MapPin(coordinate: CLLocationCoordinate2D(latitude: 51.50, longitude: -0.11))
        a2.title = "Pin 2"
        a2.subtitle = "Subtitle 2"
        
        self.mapView.addAnnotation(a2)
    }

  
    @IBAction func centerButtonClicked(_ sender: Any) {
        
        let londonLocation = CLLocation(latitude: 51.509865, longitude: -0.118092)
        // self.mapView.setCenter(londonLocation.coordinate, animated: true)
        
        let region = MKCoordinateRegion(center: londonLocation.coordinate, span: MKCoordinateSpanMake(0.2, 0.2))
        self.mapView.setRegion(region, animated: true)
    }
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // print(locations.first.debugDescription)
    }
    
    
    
    // Tells the delegate that the map view is about to start rendering some of its tiles
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("Start rendering")
    }
    
    // Tells the delegate that the specified map view is about to retrieve some map data
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("Start loading")
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("Finish loading")
    }
    
    func mapViewDidStopLocatingUser(_ mapView: MKMapView) {
        print("Stopped locating user")
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Don't want to show a custom image if the annotation is the user's location.
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        // Better to make this class property
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        if let annotationView = annotationView {
            // Configure your annotation view here
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "marker")
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard !(view.annotation is MKUserLocation) else { return }

        mapView.setCenter((view.annotation?.coordinate)!, animated: true)
    }
    
    
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        let _ = view.subviews.map { $0.removeFromSuperview() }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("tapped annotation " + ((view.annotation?.title)!)!)
    }
}

class MapPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}

