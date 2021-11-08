//
//  HomeView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/08.
//

import UIKit
import Then
import SnapKit
import NMapsMap

final class HomeView: UIView, CLLocationManagerDelegate {

    // 지도
    let mapView = NMFMapView()
    
    // 가보자고
    private let goView = UIView().then {
        $0.backgroundColor = .systemIndigo
    }
    
    private let goLabel = UILabel().then {
        $0.text = "어디 한 번 가보자고"
    }
    
    let goButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    // 가게 재검색
    private let retrieveButton = UIButton().then {
        $0.backgroundColor = .darkGray
        $0.setTitle("현재 지도에서 가게 재검색", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.isHidden = true
    }
    
    // 마커 테스트 버튼
    private let testButton = UIButton().then {
        $0.backgroundColor = .red
        $0.setTitle("마커임", for: .normal)
    }
    
    // 가게 정보 뷰
    private let storeInfoView = StoreInfoCardViewController().then {
        $0.storeInfoView.isHidden = true
    }
    
    let viewModel = HomeViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addContentView()
        self.setAutoLayout()
        self.setNaverMap()
        
        self.retrieveButton.isHidden = true
        self.retrieveButton.addTarget(self, action: #selector(retrieveButtonDidTap), for: .touchUpInside)
        self.testButton.addTarget(self, action: #selector(testButtonDidTap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        // 지도
        self.addSubview(mapView)
        
        // 가보자고
        self.addSubview(goView)
        goView.addSubview(goLabel)
        goView.addSubview(goButton)
        
        // 가게 재검색
        self.addSubview(retrieveButton)
        
        // 마커 테스트 버튼
        self.addSubview(testButton)
        
        // 가게 정보
        self.addSubview(storeInfoView.storeInfoView)
    }
    
    private func setAutoLayout() {
        let safeArea = self.safeAreaLayoutGuide
        
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
        
        // 가게 재검색
        retrieveButton.snp.makeConstraints {
            $0.top.equalTo(goView.snp.bottom).offset(10)
            $0.centerX.equalTo(safeArea)
            $0.width.equalTo(100)
        }
        
        // 마커 테스트 버튼
        testButton.snp.makeConstraints {
            $0.right.bottom.equalTo(safeArea).offset(-140)
            $0.width.equalTo(50)
        }
        
        // 가게 정보 뷰
        storeInfoView.storeInfoView.snp.makeConstraints {
            $0.bottom.equalTo(safeArea).offset(-10)
            $0.centerX.equalTo(safeArea)
            $0.width.equalTo(300) // 그냥 해놓은겨
        }
        
    }
    
    // MARK: - 지도 설정
    func setNaverMap() {
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
    // 가게 재검색 뷰 숨기기
    func retrieveButtonIsHidden(_ value: Bool) {
        retrieveButton.isHidden = value
    }
    
    @objc func retrieveButtonDidTap(_ sender: UIButton) {
        retrieveButton.isHidden = true
    }
    
    
    
    // 마커 테스트 버튼
    @objc func testButtonDidTap(_ sender: UIButton) {
        self.storeInfoView.storeInfoView.isHidden = false
    }
}
extension HomeView: NMFMapViewCameraDelegate {
    
    // 카메라 움직이고 손 떼면 카페 재검색 버튼 뜨기
    func mapViewCameraIdle(_ mapView: NMFMapView) {
        retrieveButtonIsHidden(false)
        print("카페 재검색")
    }
}
