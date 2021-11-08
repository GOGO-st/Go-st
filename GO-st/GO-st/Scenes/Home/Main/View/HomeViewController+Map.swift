//
//  HomeViewController+Map.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import NMapsMap
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
    }
    
    // MARK: - 줌 아웃 제한
    // 이정도면 수도권까지 줌아웃 가능
    func setZoom() {
        let region = MKCoordinateRegion(center: self.schoolCenter.coordinate,
                                        latitudinalMeters: 50000,
                                        longitudinalMeters: 60000)
        homeView.mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region),
                                           animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        homeView.mapView.setCameraZoomRange(zoomRange, animated: true)
    }
}

extension HomeViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        homeView.retrieveButtonIsHidden()
        print("카페 재검색")
    }
}
