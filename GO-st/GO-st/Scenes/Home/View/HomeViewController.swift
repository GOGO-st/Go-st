//
//  HomeViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import NMapsMap
import Then
import SnapKit

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    static let identifier = "HomeViewController"

    // 지도
    let mapView = NMFMapView()
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addContentView()
        setAutoLayout()
        setNaverMap()
    }
    
    

}

// MARK: - UI 설정
extension HomeViewController {
    private func addContentView() {
        view.addSubview(mapView)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        mapView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.bottom.equalTo(safeArea)
        }
    }
    
    // MARK: - 지도 설정
    private func setNaverMap() {
        viewModel.locationManager.delegate = self
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
