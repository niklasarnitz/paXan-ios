// Copyright © 2019 SWDEC. All rights reserved.

import MapKit
import UIKit

class MapViewController: UIViewController {
    private let initialLocation = CLLocation(latitude: 48.796355, longitude: 8.503494)
    private let regionRadius: CLLocationDistance = 100
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()

    private let annotations: [MKPointAnnotation] = [
        {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: 48.796355, longitude: 8.503494)
            annotation.title = "EC-FSZ"
            annotation.subtitle = "Hauptveranstaltungsort"
            return annotation
        }(),
        {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: 48.796360, longitude: 8.503494)
            annotation.title = "EC-FSZ2"
            annotation.subtitle = "Hauptveranstaltungsort2"
            return annotation
        }()
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }

        // TODO: Fix the navigatiobar on iOS 13. This is only a hotfix
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = Colors.ecGreen
            super.navigationController?.navigationBar.standardAppearance = navBarAppearance
            super.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }

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
        centerMapOnLocation(location: initialLocation)
        annotations.forEach { annotation in
            mapView.addAnnotation(annotation)
        }
    }

    private func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius
        )
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
