//
//  HomeViewModel.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import Foundation
import CoreLocation

class HomeViewModel {
    
    // 위치정보
    var locationManager = CLLocationManager()
    
    var stores: [Marker] = [Marker(title: "밤가시 버거",
                                         locationName: "경기도 고양시 일산동구 정발산동 일산로372번길 46",
                                         discipline: "👀",
                                         coordinate: CLLocationCoordinate2D(latitude: 37.66906773682083, longitude: 126.78460869875774)),
                                    Marker(title: "2리 식당",
                                               locationName: "경기도 고양시 일산동구 일산동구 정발산동",
                                               discipline: "🥰",
                                               coordinate: CLLocationCoordinate2D(latitude: 37.66956064613412, longitude: 126.78517534875819)),
                                    Marker(title: "재이식당",
                                          locationName: "경기도 고양시 일산동구 정발산동 1286-11",
                                          discipline: "👍",
                                          coordinate: CLLocationCoordinate2D(latitude: 37.670800813026574, longitude: 126.78361656501401)),
                                    Marker(title: "프리커피",
                                          locationName: "경기도 고양시 일산동구 마두1동 880-11",
                                          discipline: "😙",
                                          coordinate: CLLocationCoordinate2D(latitude: 37.66225049053905, longitude: 126.78828553341091))
                                         ]
    func setCurrentLocation() {
        locationManager.requestWhenInUseAuthorization() //권한요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 위치 정보 정확도
        locationManager.startUpdatingLocation() // 위치 정보 지속적으로 받겠다!
    }
    
    func currentLocationCoordinate() -> CLLocation? {
        return locationManager.location
    }
}
