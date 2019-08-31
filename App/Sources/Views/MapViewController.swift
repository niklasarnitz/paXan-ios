//
//  MapViewController.swift
//  paXan
//
//  Created by Niklas Arnitz on 26.08.19.
//  Copyright © 2019 SWDEC. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupMapView()
    }

    private func setupMapView() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
}
