//
//  HomeViewModel.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import Foundation
import CoreLocation
import NMapsMap

class HomeViewModel {
    
    // 위치정보
    var locationManager = CLLocationManager()
    
    func setCurrentLocation() {
        locationManager.requestWhenInUseAuthorization() //권한요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 위치 정보 정확도
        locationManager.startUpdatingLocation() // 위치 정보 지속적으로 받겠다!
    }
    
    func currentLocationCoordinate() -> CLLocationCoordinate2D? {
        return locationManager.location?.coordinate
    }
    
}
