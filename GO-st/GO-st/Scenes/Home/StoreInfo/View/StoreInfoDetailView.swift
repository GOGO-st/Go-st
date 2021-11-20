//
//  StoreInfoDetailView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/19.
//

import UIKit
import Then
import SnapKit
import MapKit


class StoreInfoDetailView: UIView {
    
    let scrollView = UIScrollView()
    
    let containerView = UIView()
    
    let mapView = MKMapView()
    
    let listView = UIView().then {
        $0.backgroundColor = R.color.background()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
