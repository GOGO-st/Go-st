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
    let viewModel = HomeViewModel()
    
    // 지도
    let mapView = NMFMapView()
    
    // 가보자고
    let goView = UIView().then {
        $0.backgroundColor = .systemIndigo
    }
    
    let goLabel = UILabel().then {
        $0.text = "어디 한 번 가보자고"
    }
    
    let goButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    
    
    
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
        // 지도
        view.addSubview(mapView)
        
        // 가보자고
        view.addSubview(goView)
        goView.addSubview(goLabel)
        goView.addSubview(goButton)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        // 지도
        mapView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.bottom.equalTo(safeArea)
        }
        
        // 가보자고
        goView.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(50)
            $0.left.equalTo(safeArea).offset(20)
            $0.right.equalTo(safeArea).offset(-20)
            $0.height.equalTo(50)
        }
        goLabel.snp.makeConstraints {
            $0.center.equalTo(goView)
        }
        goButton.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(goView)
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
