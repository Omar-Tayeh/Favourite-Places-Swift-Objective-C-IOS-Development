//
//  ViewController.swift
//  My FAvourite Places
//
//  Created by Apple on 09/12/2021.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate {

    
    
    @IBOutlet weak var map: MKMapView!
   
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            print("===\nLong Press began\n===")
                        let touchPoint = sender.location(in: self.map)
                        let newCoordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
                        print(newCoordinate)
                         
                        let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
                        var title = ""
                        CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                            if error != nil {
                                print(error!)
                            } else {
                                if let placemark = placemarks?[0] {
                                    if placemark.subThoroughfare != nil {
                                        title += placemark.subThoroughfare! + " "
                                    }
                                    if placemark.thoroughfare != nil {
                                        title += placemark.thoroughfare!
                                    }
                                }
                            }
                            if title == "" {
                                title = "Added \(NSDate())"
                            }
                            let annotation = MKPointAnnotation()
                            annotation.coordinate = newCoordinate
                            annotation.title = title
                            self.map.addAnnotation(annotation)
                            places.append(["name":title, "lat": String(newCoordinate.latitude), "lon":
            String(newCoordinate.longitude)])
                        } )
                    }
                }
    
    override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view, typically from a nib.
          
          guard currentPlace != -1  else { return }
          guard places.count > currentPlace else { return }
          guard let name = places[currentPlace]["name"] else { return }
          guard let lat = places[currentPlace]["lat"] else { return }
          guard let lon = places[currentPlace]["lon"] else { return }
          guard let latitude = Double(lat) else { return }
          guard let longitude = Double(lon) else { return }
          let span = MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
          let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
          let region = MKCoordinateRegion(center: coordinate, span: span)
          self.map.setRegion(region, animated: true)
          
          let annotation = MKPointAnnotation()
          annotation.coordinate = coordinate
          annotation.title = name
          self.map.addAnnotation(annotation)
          print(currentPlace)
      }

}

