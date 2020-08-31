//
//  CoordinateViewController.swift
//  SwiftUI_06_Maps
//
//  Created by Everis on 31/08/2020.
//  Copyright © 2020 Alan. All rights reserved.
//

import UIKit
import CoreLocation

class CoordinateViewController: UIViewController {

    @IBOutlet weak var coordinates: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!

    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
    
    func setDelegates () {
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    
    @IBAction func getCoordinates(_ sender: UIButton) {
        guard let latitudeDes = self.latitude, let longitudeDes = self.longitude else { return }
        self.coordinates.text = "Latitud => \(latitudeDes), \n Longitud => \(longitudeDes)"
        
        UserDefaults.standard.set(self.latitude, forKey: "latitude")
        UserDefaults.standard.set(self.longitude, forKey: "longitude")
        UserDefaults.standard.set(self.countryTextField.text, forKey: "countryTextField")
    }
    
}

extension CoordinateViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
    }
}
