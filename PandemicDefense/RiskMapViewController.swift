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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        RiskMapView.delegate = self
        
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
//        RiskMapView.centerToLocation(initialLocation)
        
        self.createAnnotations(locations: annotationLocations)
        
    }
    
    
    
    let annotationLocations = [
        ["title": "Netherlands", "latitude": 12.226079, "longitude": -69.060087],
        ["title": "Argentina", "latitude": -38.416097, "longitude": -63.616672],
        ["title": "Austria", "latitude": 47.516231, "longitude": 14.550072],
        ["title": "Australia", "latitude": -25.274398, "longitude": 133.775136],
        ["title": "Belgium", "latitude": 50.503887, "longitude": 4.469936],
        ["title": "Bulgaria", "latitude": 42.733883, "longitude": 25.48583],
        ["title": "Bolivia", "latitude": -16.290154, "longitude": -63.588653],
        ["title": "Canada", "latitude": 56.130366, "longitude": -106.346771],
        ["title": "Switzerland", "latitude": 46.818188, "longitude": 8.227512],
        ["title": "Chile", "latitude": -35.675147, "longitude": -71.542969],
        ["title": "Cyprus", "latitude": 35.126413, "longitude": 33.429859],
        ["title": "Germany", "latitude": 51.165691, "longitude": 10.451526],
        ["title": "Denmark", "latitude": 56.26392, "longitude": 9.501785],
        ["title": "Algeria", "latitude": 28.033886, "longitude": 1.659626],
        ["title": "Estonia", "latitude": 58.595272, "longitude": 25.013607],
        ["title": "Spain", "latitude": 40.463667, "longitude": -3.74922],
        ["title": "Finland", "latitude": 61.92411, "longitude": 25.748151],
        ["title": "France", "latitude": 46.227638, "longitude": 2.213749],
        ["title": "United Kingdom", "latitude": 55.378051, "longitude": -3.435973],
        ["title": "Greece", "latitude": 39.074208, "longitude": 21.824312],
        ["title": "Croatia", "latitude": 45.1, "longitude": 15.2],
        ["title": "Hungary", "latitude": 47.162494, "longitude": 19.503304],
        ["title": "Ireland", "latitude": 53.41291, "longitude": -8.24389],
        ["title": "Israel", "latitude": 31.046051, "longitude": 34.851612],
        ["title": "Iceland", "latitude": 64.963051, "longitude": -19.020835],
        ["title": "Italy", "latitude": 41.87194, "longitude": 12.56738],
        ["title": "Japan", "latitude": 36.204824, "longitude": 138.252924],
        ["title": "South Korea", "latitude": 35.907757, "longitude": 127.766922],
        ["title": "Liechtenstein", "latitude": 47.166, "longitude": 9.555373],
        ["title": "Lithuania", "latitude": 55.169438, "longitude": 23.881275],
        ["title": "Luxembourg", "latitude": 49.815273, "longitude": 6.129583],
        ["title": "Latvia", "latitude": 56.879635, "longitude": 24.603189],
        ["title": "Malta", "latitude": 35.937496, "longitude": 14.375416],
        ["title": "Malaysia", "latitude": 4.210484, "longitude": 101.975766],
        ["title": "Netherlands", "latitude": 52.132633, "longitude": 5.291266],
        ["title": "Norway", "latitude": 60.472024, "longitude": 8.468946],
        ["title": "Poland", "latitude": 51.919438, "longitude": 19.145136],
        ["title": "Portugal", "latitude": 39.399872, "longitude": -8.224454],
        ["title": "Romania" , "latitude": 45.943161, "longitude": 24.96676],
        ["title": "Serbia", "latitude": 44.016521, "longitude": 21.005859],
        ["title": "Russia", "latitude": 61.52401, "longitude": 105.318756],
        ["title": "Sweden", "latitude": 60.128161, "longitude": 18.643501],
        ["title": "Singapore", "latitude": 1.352083, "longitude": 103.819836]    ,
        ["title": "Slovenia", "latitude": 46.151241, "longitude": 14.995463],
        ["title": "Slovakia", "latitude": 48.669026, "longitude": 19.699024],
        ["title": "United States", "latitude": 37.09024, "longitude":-95.712891]
    ]
    
    func createAnnotations(locations: [[String: Any]]){
        for location in locations{
            let annotations = MKPointAnnotation();
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            
            RiskMapView.addAnnotation(annotations)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
        // annotationView.markerTintColor = UIColor.blue
        if((annotation.title).range
        
        return annotationView
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
