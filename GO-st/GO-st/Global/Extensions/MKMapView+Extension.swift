//
//  MKMapView+Extension.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/08.
//

import MapKit

extension MKMapView {
  func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 500) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
