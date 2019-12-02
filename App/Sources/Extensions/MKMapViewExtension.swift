// Copyright © 2019 SWDEC. All rights reserved.

import MapKit

extension MKMapView {
    func centerMapOnLocation(
        location: CLLocation,
        regionRadius: CLLocationDistance
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius
        )
      self.setRegion(coordinateRegion, animated: true)
    }
}
