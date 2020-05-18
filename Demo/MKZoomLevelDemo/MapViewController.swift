//
//  ViewController.swift
//  MKZoomLevelDemo
//
//  Created by 김동규 on 2020/05/18.
//  Copyright © 2020 Stleam. All rights reserved.
//

import UIKit
import SwiftUI
import MapKit
import MKZoomLevel

class MapViewController: UIViewController {
    
    let dashboardVC = UIHostingController(rootView: DashboardView())
    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDashboardView()
        addMapView()
        
        setupViews()
    }
    
    private func addDashboardView() {
        self.addChild(dashboardVC)
        
        self.view.addSubview(dashboardVC.view)
        
        dashboardVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dashboardVC.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            dashboardVC.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            dashboardVC.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            dashboardVC.view.heightAnchor.constraint(equalToConstant: dashboardVC.view.intrinsicContentSize.height)
        ])
        
        dashboardVC.didMove(toParent: self)
    }
    
    private func addMapView() {
        self.view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: dashboardVC.view.bottomAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupViews() {
        mapView.delegate = self
        
        self.view.backgroundColor = .systemBackground
        mapView.overrideUserInterfaceStyle = .light
        mapView.layer.cornerRadius = 16
        mapView.layer.cornerCurve = .continuous
        
        dashboardVC.rootView.onValueChanged = { zoomLevel in
            self.mapView.setZoomLevel(zoomLevel, animated: true)
        }
    }
    
    // for testing
    private func moveCameraTo180thMeridianRegion() {
        let center = CLLocationCoordinate2D(latitude: 65, longitude: 180)
        let distance: CLLocationDistance = 30000
        let camera = MKMapCamera(lookingAtCenter: center, fromDistance: distance, pitch: 0, heading: 0)
        mapView.camera = camera
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        updateDashboard(with: mapView)
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        updateDashboard(with: mapView)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        updateDashboard(with: mapView)
    }
    
    private func updateDashboard(with mapView: MKMapView) {
        dashboardVC.rootView.zoomLevels.system = mapView._zoomLevel ?? .nan
        dashboardVC.rootView.zoomLevels.computed = mapView.zoomLevel
    }
}

extension MKMapView {
    var _zoomLevel: CGFloat? { self.value(forKey: "_zoomLevel") as? CGFloat }
}
