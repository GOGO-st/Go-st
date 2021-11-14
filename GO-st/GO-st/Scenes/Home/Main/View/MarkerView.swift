//
//  MarkerView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/11.
//

import Foundation
import MapKit

class HomeDataMarkerView: MKMarkerAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      // 1
      guard let homeData = newValue as? Marker else {
        return
      }
      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

      // 2
//      markerTintColor = homeData.markerTintColor
      glyphImage = homeData.image
    }
  }
}

class HomeDataView: MKAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      guard let homeData = newValue as? Marker else {
        return
      }

      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 48, height: 48)))
      mapsButton.setBackgroundImage(#imageLiteral(resourceName: "Map"), for: .normal)
      rightCalloutAccessoryView = mapsButton

      image = homeData.image
      
      let detailLabel = UILabel()
      detailLabel.numberOfLines = 0
      detailLabel.font = detailLabel.font.withSize(12)
      detailLabel.text = homeData.subtitle
      detailCalloutAccessoryView = detailLabel
    }
  }
}
