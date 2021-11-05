//
//  HomeViewController+NaverMap.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import NMapsMap

extension HomeViewController {
    // MARK: - 지도 설정
    private func setNaverMap() {
        viewModel.locationManager.delegate = self
        mapView.addCameraDelegate(delegate: self)
        
        viewModel.setCurrentLocation()
//        let locationOverlay = mapView.locationOverlay
//        locationOverlay.icon =
//        locationOverlay.subIcon =
//        locationOverlay.circleRadius = 0 // 기본 원그림자 없애기
        
        move(at: viewModel.currentLocationCoordinate())
    }
    // MARK: - 현위치로 이동
    private func move(at coor: CLLocationCoordinate2D?) {
        if let coor = coor {
            let camera = NMFCameraUpdate(scrollTo: NMGLatLng(lat: coor.latitude, lng: coor.longitude))
            mapView.moveCamera(camera)
        }
        
    }
}
extension HomeViewController: NMFMapViewCameraDelegate {
    
    // 카메라 움직이고 손 떼면 카페 재검색 버튼 뜨기
    func mapViewCameraIdle(_ mapView: NMFMapView) {
        retrieveButtonIsHidden(false)
        print("카페 재검색")
    }
}
