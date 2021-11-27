//
//  HomeViewModel.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import Foundation
import CoreLocation

// 임시 모델
struct DetailStoreData {
    var storeName: String
    var address: String
    var coordinate: CLLocationCoordinate2D
    var emoji: String
}

class HomeViewModel {
    
    // 위치정보
    var locationManager = CLLocationManager()
    
    var stores: [Marker] = [Marker(title: "동네요리사",
                                 locationName: "서울 성북구 화랑로15길 28",
                                 discipline: "👀",
                                 coordinate: CLLocationCoordinate2D(latitude: 37.60542127763483, longitude: 127.04471641117769)),
                            Marker(title: "밥은화",
                                       locationName: "서울 성북구 장월로1길 70 1층 밥은화 동덕여대점",
                                       discipline: "🥰",
                                       coordinate: CLLocationCoordinate2D(latitude: 37.605741677645064, longitude: 127.04443682652204)),
                            Marker(title: "조가연마라탕",
                                  locationName: "서울 성북구 화랑로 90",
                                  discipline: "👍",
                                  coordinate: CLLocationCoordinate2D(latitude: 37.60247697992248, longitude: 127.04228556885096)),
                            Marker(title: "핏짜피자",
                                  locationName: "서울 성북구 화랑로11길 31",
                                  discipline: "😙",
                                  coordinate: CLLocationCoordinate2D(latitude: 37.60374667947277, longitude: 127.04197114001548)),
                            Marker(title: "DA피자",
                                  locationName: "서울 성북구 화랑로13길 46",
                                  discipline: "😇",
                                  coordinate: CLLocationCoordinate2D(latitude: 37.60602879126259, longitude: 127.04163574558333)),
                            Marker(title: "제나키친",
                                  locationName: "서울 성북구 화랑로11길 23",
                                  discipline: "👏",
                                  coordinate: CLLocationCoordinate2D(latitude: 37.60341697962343, longitude: 127.04167236885091)),
                            Marker(title: "토라카츠",
                                  locationName: "서울 성북구 장월로1길 90",
                                  discipline: "😽",
                                  coordinate: CLLocationCoordinate2D(latitude: 37.605006478896705, longitude: 127.04368964001543)),
                            Marker(title: "스페셜커피넘버원 동덕여대점",
                                  locationName: "서울 성북구 화랑로11길 23-10",
                                  discipline: "😸",
                                  coordinate: CLLocationCoordinate2D(latitude: 37.60369554952192, longitude: 127.04121409988845))
                                 ]

    var detailStoreData: DetailStoreData?
    
    func setCurrentLocation() {
        locationManager.requestWhenInUseAuthorization() //권한요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 위치 정보 정확도
        locationManager.startUpdatingLocation() // 위치 정보 지속적으로 받겠다!
    }
    
    func currentLocationCoordinate() -> CLLocation? {
        return locationManager.location
    }
}
