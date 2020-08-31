//
//  UserMapView.swift
//  SwiftUI_06_Maps
//
//  Created by Everis on 31/08/2020.
//  Copyright © 2020 Alan. All rights reserved.
//

import SwiftUI
import MapKit

struct UserMapView: View {
    
    @State var manager = CLLocationManager()
    @State var alert: Bool = false

    var body: some View {
        UserMap(manager: self.$manager, alert: self.$alert)
            .alert(isPresented: self.$alert) {
                Alert(title: Text("Necesitamos tu localizacion para continuar"))
        }
    }
}

struct UserMapView_Previews: PreviewProvider {
    static var previews: some View {
        UserMapView()
    }
}

struct UserMap: UIViewRepresentable {
    
    @Binding var manager: CLLocationManager
    @Binding var alert: Bool
    
    let map = MKMapView()
    
    func makeCoordinator() -> UserMap.Coordinator {
        return Coordinator.init(connection: self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let coordinate = CLLocationCoordinate2D(latitude: 40.099740, longitude: -4.041360)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        map.region = region
        manager.requestWhenInUseAuthorization()
        manager.delegate = context.coordinator
        manager.startUpdatingLocation()
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        
    }
    
    class Coordinator: NSObject, CLLocationManagerDelegate {
        var connection: UserMap
        
        init(connection: UserMap) {
            self.connection = connection
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            switch status {
            case .notDetermined:
                self.connection.alert.toggle()
            case .restricted: break
            case .denied:
                self.connection.alert.toggle()
            case .authorizedAlways: break
            case .authorizedWhenInUse: break
            @unknown default:
                break
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            let annotation = MKPointAnnotation()
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { (place, error) in
                if error != nil {
                    print(error?.localizedDescription)
                    return
                } else {
                    
                    let place = place?.first?.locality
                    annotation.title = place
                    annotation.coordinate = location.coordinate
                    self.connection.map.removeAnnotations(self.connection.map.annotations)
                    self.connection.map.addAnnotation(annotation)
                    let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                    let region = MKCoordinateRegion(center: location.coordinate, span: span)
                    self.connection.map.region = region
                }
            }
        }
        
    }
    
}
