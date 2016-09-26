//
//  MapViewController.swift
//  World Trotter
//
//  Created by Andrew Barber on 9/25/16.
//  Copyright © 2016 Invictus. All rights reserved.
//

import UIKit
import Foundation
import MapKit


class MapViewController : UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        
        mapView = MKMapView()
        
        view = mapView
    
        
        let segItems : Array = ["Standard", "Hybrid", "Satellite"]
        let segControl : UISegmentedControl = UISegmentedControl(items: segItems)
        
        segControl.backgroundColor = UIColor.init(white: 1.0, alpha: 0.5)
        segControl.selectedSegmentIndex = 0
        
        segControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(segControl)
        
        segControl.addTarget(self, action: #selector(mapTypeChanged), for: UIControlEvents.valueChanged)
        
        let segControlTopConstraint = segControl.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant : 8)
        let margins : UILayoutGuide = self.view.layoutMarginsGuide
        let leadingConstraint = segControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        segControlTopConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        
    }
    
    
    override func viewDidLoad () {
        
        super.viewDidLoad()
        
        print("Hello darkness my old friend")
        
    }
 
    func mapTypeChanged(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.mapView.mapType = MKMapType.standard
            break
        case 1:
            self.mapView.mapType = MKMapType.hybrid
            break
        case 2:
            self.mapView.mapType = MKMapType.satellite
        default:
            break
            
        }
        
    }
}

























