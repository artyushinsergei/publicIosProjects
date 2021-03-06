//
//  ViewController.swift
//  MapKitProd
//
//  Created by SERGEI on 13.06.2022.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initLocation = CLLocation(latitude: 59.929691, longitude: 30.362239)
        mapView.centerLocation(initLocation)
        
        let cameraCenter = CLLocation(latitude: 59.929691, longitude: 30.362239)
        let region = MKCoordinateRegion(center: cameraCenter.coordinate, latitudinalMeters: 50000, longitudinalMeters: 50000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region),animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 100000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        let kc = Places(title: "Казанский собор",
                        locationName: "Казанская пл. 2",
                        discipline: "Cathedral",
                        coordinate: CLLocationCoordinate2D(latitude: 59.934257, longitude: 30.324495))
        
        mapView.addAnnotation(kc)
    }
    

}

extension MKMapView{
    
    func centerLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000){
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
    
}
 
extension ViewController: MKMapViewDelegate{
    func mapView
    
    
    
//     {
//        guard let annotation = annotation as? Places else {
//            return nil
//        }
//
//        let identifier = "places"
//        let view: MKMarkerAnnotationView
//    }
//
//    if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: "places") as? MKMarkerAnnotationView{
//        dequeuedView.annotation = annotation
//        view = dequeuedView
//    } else {
//        view = MKMarkerAnnotationView(annotation: MKAnnotation)
//    }
//}
}
