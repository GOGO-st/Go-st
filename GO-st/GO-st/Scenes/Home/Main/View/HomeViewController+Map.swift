//
//  HomeViewController+Map.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import MapKit

extension HomeViewController {
    // MARK: - 초기 위치 설정
    func setInitialLocation() {
        // 현위치
//        if let initialLocation = viewModel.currentLocationCoordinate() {
//            homeView.mapView.centerToLocation(initialLocation)
//        }
        
        // 성신여대
        homeView.mapView.centerToLocation(self.schoolCenter)
    }
    
    // MARK: - 지도 설정
    func setMap() {
        viewModel.locationManager.delegate = self
        homeView.mapView.delegate = self
        viewModel.setCurrentLocation()
        // 줌 제한
        homeView.mapView.setZoom(center: self.schoolCenter)
    }
}

extension HomeViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        homeView.retrieveButtonIsHidden()
        print("카페 재검색")
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("마커 선택~! \(view)")
        self.homeView.storeInfoView.bind(mapView.selectedAnnotations[0])
        // 임시
        self.homeView.storeInfoView.countView.bindEmoji(["👻","😢","😆"])
        self.homeView.storeInfoView.countView.bindCount("11")
        self.homeView.storeInfoView.activate()
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        print("마커 선택 취소~! \(view)")
        self.homeView.storeInfoView.deactivate()
    }
}
