//
//  GeneralMapView.swift
//  SwiftUI_06_Maps
//
//  Created by Everis on 31/08/2020.
//  Copyright © 2020 Alan. All rights reserved.
//

import SwiftUI
import MapKit

struct GeneralMapView: View {
    
    @State private var latitude: Double = 40.099740
    @State private var longitude: Double = -4.041360
    @State private var zoom: Double = 0.03
    @State private var title: String = "chozas de canales"

    var body: some View {
        VStack {
            Map(latitude: latitude, longitude: longitude, zoom: zoom, title: title)
        }
        .onAppear {
            if (UserDefaults.standard.value(forKey: "latitude") != nil),
                (UserDefaults.standard.value(forKey: "longitude") != nil),
                (UserDefaults.standard.value(forKey: "countryTextField") != nil)  {
                self.latitude = UserDefaults.standard.value(forKey: "latitude") as! Double
                self.longitude = UserDefaults.standard.value(forKey: "longitude") as! Double
                self.title = UserDefaults.standard.value(forKey: "countryTextField") as! String
            }
        }
    }
}

struct GeneralMapView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralMapView()
    }
}

struct Map: UIViewRepresentable {

    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    var zoom: Double
    var title: String

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: zoom, longitudeDelta: zoom)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        uiView.addAnnotation(annotation)
        uiView.setRegion(region, animated: true)
    }
}
