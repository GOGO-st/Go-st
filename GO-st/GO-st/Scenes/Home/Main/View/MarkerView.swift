//
//  MarkerView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/11.
//

import Foundation
import MapKit

class MarkerView: MKMarkerAnnotationView {
    
    let imageView = MarkerImageView(frame: CGRect(x: 0, y: 0, width: 56, height: 56))

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(self)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override var annotation: MKAnnotation? {
        willSet {
            guard let store = newValue as? Marker else {
                return
            }
            
            
//            animatesWhenAdded = true
//            canShowCallout = true
//            calloutOffset = CGPoint(x: -5, y: 5)
//            rightCalloutAccessoryView = StoreInfoCardView(marker: store)//UIButton(type: .detailDisclosure)

            glyphImage = R.image.map.marker.empty()
            markerTintColor = store.markerTintColor
            
            if let letter = store.discipline?.first {
                imageView.label.text = String(letter)
            }
        }
    }
}
