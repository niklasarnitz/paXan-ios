// Copyright © 2019 SWDEC. All rights reserved.

import MapKit

extension MKMapView {
    /// This function centers the map on a given location
    func centerMapOnLocation(
        /// The Location the Map is focused on
        location: CLLocation,
        /// The Radius around the location which will be seen
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
