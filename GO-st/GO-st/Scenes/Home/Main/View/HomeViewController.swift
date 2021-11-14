//
//  HomeViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import MapKit
import Then
import SnapKit

final class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    static let identifier = "HomeViewController"
    let viewModel = HomeViewModel()
    let homeView = HomeView()
    
    // 성신여대
//    let schoolCenter = CLLocation(latitude: 37.591433, longitude: 127.021217)
    // 밤가시
    let schoolCenter = CLLocation(latitude: 37.66906773682083, longitude: 126.78460869875774)

    
    private var stores: [Marker] = [Marker(title: "밤가시 버거",
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setMap()
        self.setInitialLocation()
        self.setZoom()
        
        homeView.goButton.addTarget(self, action: #selector(goButtonDidTap), for: .touchUpInside)
        
        view.addSubview(homeView)
        homeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        homeView.mapView.addAnnotations(stores)
        homeView.mapView.register(MarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    }
    
    
    // 카테고리 뷰 버튼
    @objc func goButtonDidTap(_ sender: UIButton) {
        let categoryVC = CategoryViewController()
        categoryVC.modalPresentationStyle = .overFullScreen
        categoryVC.modalTransitionStyle = .crossDissolve
        present(categoryVC, animated: true, completion: nil)
    }

}
