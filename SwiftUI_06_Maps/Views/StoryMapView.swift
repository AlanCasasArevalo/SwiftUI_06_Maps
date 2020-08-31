//
//  StoryMapView.swift
//  SwiftUI_06_Maps
//
//  Created by Everis on 31/08/2020.
//  Copyright © 2020 Alan. All rights reserved.
//

import SwiftUI

struct StoryMapView: View {
    var body: some View {
        CustomMapViewController()
    }
}

struct StoryMapView_Previews: PreviewProvider {
    static var previews: some View {
        StoryMapView()
    }
}

struct CustomMapViewController: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = MapViewController(nibName: "MapViewController", bundle: Bundle.main)
        let navVC = UINavigationController(rootViewController: viewController)
        return navVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
}
