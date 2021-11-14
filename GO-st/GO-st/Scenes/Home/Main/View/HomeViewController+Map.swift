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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView: MKAnnotationView?
        
        //원하는 위치에 넣을 이미지뷰
        let annotationimageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let image = R.image.map.selected.evil()
        annotationimageView.image = image
        
//        //원하는 위치에 넣을 레이블
//        let annotationLabel = UILabel(frame: CGRect(x: 0, y: -35, width: 45, height: 15))
//        annotationLabel.backgroundColor = .systemOrange
//        annotationLabel.textColor = .white
//        annotationLabel.numberOfLines = 3
//        annotationLabel.textAlignment = .center
//        annotationLabel.font = UIFont.boldSystemFont(ofSize: 10)
//        annotationLabel.text = annotation.title!
        
        annotationView?.addSubview(annotationimageView)
        
        return annotationView
    }
}
