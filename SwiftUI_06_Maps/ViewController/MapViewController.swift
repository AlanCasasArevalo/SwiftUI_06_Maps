//
//  MapViewController.swift
//  SwiftUI_06_Maps
//
//  Created by Everis on 31/08/2020.
//  Copyright © 2020 Alan. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var cusctomMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let coordinator = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentCoordinatorView))
        self.navigationItem.rightBarButtonItem = coordinator

    }
    
    @objc func presentCoordinatorView (){
        let viewController = CoordinateViewController(nibName: "CoordinateViewController", bundle: Bundle.main)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
