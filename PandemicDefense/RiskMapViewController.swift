//
//  RiskMapViewController.swift
//  PandemicDefense
//
//  Created by Pranav Kumar Soma on 4/23/22.
//

import Foundation

import UIKit
import MapKit
class RiskMapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var RiskMapView: MKMapView!
    
    @IBOutlet weak var MaskRecommend: UILabel!
    
    struct GlobalVariable{
            static var riskIndex = 4.5
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        RiskMapView.delegate = self
        
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
//        RiskMapView.centerToLocation(initialLocation)
        
        self.createAnnotations(locations: annotationLocations)
        
    }
    
    
    
    let annotationLocations = [
        ["title": "Netherlands", "latitude": 52.3676, "longitude": 4.9041, "risk": 4.5],
        ["title": "Argentina", "latitude": -38.416097, "longitude": -63.616672, "risk": 4.5],
        ["title": "Austria", "latitude": 47.516231, "longitude": 14.550072, "risk": 3.5],
        ["title": "Australia", "latitude": -25.274398, "longitude": 133.775136, "risk": 7.5],
        ["title": "Belgium", "latitude": 50.503887, "longitude": 4.469936, "risk": 5.5],
        ["title": "Bulgaria", "latitude": 42.733883, "longitude": 25.48583, "risk": 6.5],
        ["title": "Bolivia", "latitude": -16.290154, "longitude": -63.588653, "risk": 8.5],
        ["title": "Canada", "latitude": 56.130366, "longitude": -106.346771, "risk": 9.5],
        ["title": "Switzerland", "latitude": 46.818188, "longitude": 8.227512, "risk": 1.5],
        ["title": "Chile", "latitude": -35.675147, "longitude": -71.542969, "risk": 2.5],
        ["title": "Cyprus", "latitude": 35.126413, "longitude": 33.429859, "risk": 4.8],
        ["title": "Germany", "latitude": 51.165691, "longitude": 10.451526, "risk": 8.5],
        ["title": "Denmark", "latitude": 56.26392, "longitude": 9.501785, "risk": 1.2],
        ["title": "Algeria", "latitude": 28.033886, "longitude": 1.659626, "risk": 4.7],
        ["title": "Estonia", "latitude": 58.595272, "longitude": 25.013607, "risk": 9.5],
        ["title": "Spain", "latitude": 40.463667, "longitude": -3.74922, "risk": 6.3],
        ["title": "Finland", "latitude": 61.92411, "longitude": 25.748151, "risk": 2.1],
        ["title": "France", "latitude": 46.227638, "longitude": 2.213749, "risk": 5.5],
        ["title": "United Kingdom", "latitude": 55.378051, "longitude": -3.435973, "risk": 4.5],
        ["title": "Greece", "latitude": 39.074208, "longitude": 21.824312, "risk": 9.2],
        ["title": "Croatia", "latitude": 45.1, "longitude": 15.2, "risk": 2.3],
        ["title": "Hungary", "latitude": 47.162494, "longitude": 19.503304, "risk": 4.4],
        ["title": "Ireland", "latitude": 53.41291, "longitude": -8.24389, "risk": 4.8],
        ["title": "Israel", "latitude": 31.046051, "longitude": 34.851612, "risk": 4.9],
        ["title": "Iceland", "latitude": 64.963051, "longitude": -19.020835, "risk": 4.1],
        ["title": "Italy", "latitude": 41.87194, "longitude": 12.56738, "risk": 1.5],
        ["title": "Japan", "latitude": 36.204824, "longitude": 138.252924, "risk": 0.5],
        ["title": "South Korea", "latitude": 35.907757, "longitude": 127.766922, "risk": 6.8],
        ["title": "Liechtenstein", "latitude": 47.166, "longitude": 9.555373, "risk": 7.3],
        ["title": "Lithuania", "latitude": 55.169438, "longitude": 23.881275, "risk": 7.5],
        ["title": "Luxembourg", "latitude": 49.815273, "longitude": 6.129583, "risk": 7.2],
        ["title": "Latvia", "latitude": 56.879635, "longitude": 24.603189, "risk": 5.6],
        ["title": "Malta", "latitude": 35.937496, "longitude": 14.375416, "risk": 6.7],
        ["title": "Malaysia", "latitude": 4.210484, "longitude": 101.975766, "risk": 7.8],
        ["title": "Netherlands", "latitude": 52.132633, "longitude": 5.291266, "risk": 8.3],
        ["title": "Norway", "latitude": 60.472024, "longitude": 8.468946, "risk": 2.5],
        ["title": "Poland", "latitude": 51.919438, "longitude": 19.145136, "risk": 3.5],
        ["title": "Portugal", "latitude": 39.399872, "longitude": -8.224454, "risk": 4.5],
        ["title": "Romania" , "latitude": 45.943161, "longitude": 24.96676, "risk": 5.5],
        ["title": "Serbia", "latitude": 44.016521, "longitude": 21.005859, "risk": 6.5],
        ["title": "Russia", "latitude": 61.52401, "longitude": 105.318756, "risk": 7.5],
        ["title": "Sweden", "latitude": 60.128161, "longitude": 18.643501, "risk": 8.5],
        ["title": "Singapore", "latitude": 1.352083, "longitude": 103.819836, "risk": 9.5],
        ["title": "Slovenia", "latitude": 46.151241, "longitude": 14.995463, "risk": 1.5],
        ["title": "Slovakia", "latitude": 48.669026, "longitude": 19.699024, "risk": 2.5],
        ["title": "United States", "latitude": 37.09024, "longitude":-95.712891, "risk": 3.5]
    ]
    
    func createAnnotations(locations: [[String: Any]]){
        for location in locations{
            let annotations = MKPointAnnotation();
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            
            annotations.title = location["title"] as? String
            
            RiskMapView.addAnnotation(annotations)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
        // annotationView.markerTintColor = UIColor.blue
        
        let annotationTitle = annotation.title
        for stuff in annotationLocations{
            if(stuff["title"] as? String == annotationTitle){
                
                let constant = stuff["risk"] as? Double ?? 0
                
                annotationView.markerTintColor = UIColor(red: (255.0/255), green: ((255-25.5*constant)/255), blue: ((255-25.5*constant)/255), alpha: 1.0)
                
            }
        }
        
        
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
        {
            if let annotationTitle = view.annotation?.title
            {
                
                for stuff in annotationLocations{
                    if(stuff["title"] as? String == annotationTitle){
                        MaskRecommend.text = "Risk index: \(stuff["risk"] ?? -1)"
                        GlobalVariable.riskIndex = stuff["risk"] as? Double ?? 5.0
                        //print("Risk index: \(stuff["risk"] ?? -1)")
                    }
                }
            }
        }
}

//private extension MKMapView {
//    func centerToLocation(
//        _ location: CLLocation,
//        regionRadius: CLLocationDistance = 100000
//    ) {
//        let coordinateRegion = MKCoordinateRegion(
//            center: location.coordinate,
//            latitudinalMeters: regionRadius,
//            longitudinalMeters: regionRadius)
//        setRegion(coordinateRegion, animated: true)
//    }
//}
