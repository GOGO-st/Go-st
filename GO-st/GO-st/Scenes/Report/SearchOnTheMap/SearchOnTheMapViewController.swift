//
//  SearchOnTheMapViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/06.
//

import UIKit
import Then
import SnapKit
import MapKit

final class SearchOnTheMapViewController: UIViewController, CLLocationManagerDelegate {

    static let identifier = "ReportStartViewController"
    
    private let titleView = NavigationTitleView().then {
        $0.leftButton.isHidden = false
    }
    private let searchMapView = SearchOnTheMapView()
    
    let viewModel = HomeViewModel()
    
    // 성신여대
    let schoolCenter = CLLocation(latitude: 37.591433, longitude: 127.021217)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = R.color.background()
        
        self.addContentView()
        self.setAutoLayout()
        self.setInitialLocation()
        self.setMap()
        self.setZoom()
        
        
        titleView.leftButton.addTarget(self, action: #selector(leftButtonDidTap), for: .touchUpInside)
    }
    
    private func addContentView() {
        view.addSubview(titleView)
        view.addSubview(searchMapView)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        // 네비게이션 타이틀
        titleView.snp.makeConstraints {
            $0.top.left.right.equalTo(safeArea)
        }
        // 전체 뷰
        searchMapView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.left.right.bottom.equalTo(safeArea)
        }
    }
    
    // 해당 좌표 얻기
    private func locationUpdate() {
        let coord = searchMapView.mapView.convert(searchMapView.marker.center, toCoordinateFrom: searchMapView)
        searchMapView.addressLabel.text = String(format: "지도좌표: (%.5f, %.5f)", coord.latitude, coord.longitude)
    }
    
    // 이전뷰로 돌아가기
    @objc private func leftButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SearchOnTheMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        locationUpdate()
        // 서버 연결
    }
}
extension SearchOnTheMapViewController {
    // MARK: - 초기 위치 설정
    func setInitialLocation() {
        // 현위치
//        if let initialLocation = viewModel.currentLocationCoordinate() {
//            searchMapView.mapView.centerToLocation(initialLocation)
//        }
        
        // 성신여대
        searchMapView.mapView.centerToLocation(self.schoolCenter)
    }
    
    // MARK: - 지도 설정
    func setMap() {
        viewModel.locationManager.delegate = self
        searchMapView.mapView.delegate = self
        viewModel.setCurrentLocation()
    }
    
    // MARK: - 줌 아웃 제한
    // 이정도면 수도권까지 줌아웃 가능
    func setZoom() {
        let region = MKCoordinateRegion(center: self.schoolCenter.coordinate,
                                        latitudinalMeters: 50000,
                                        longitudinalMeters: 60000)
        searchMapView.mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region),
                                           animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        searchMapView.mapView.setCameraZoomRange(zoomRange, animated: true)
    }
}
