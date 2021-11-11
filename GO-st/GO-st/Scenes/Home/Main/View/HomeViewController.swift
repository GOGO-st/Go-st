//
//  HomeViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
//import NMapsMap
import MapKit
import Then
import SnapKit

final class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    static let identifier = "HomeViewController"
    let viewModel = HomeViewModel()
    let homeView = HomeView()
    
    // 성신여대
    let schoolCenter = CLLocation(latitude: 37.591433, longitude: 127.021217)

    let store = StoreData (
        storeName: "핑크페퍼",
        longitude: 37.59130619619549, latitude: 127.02003442515684,
        emoji: "evil")
    
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
        
        
        let marker = Marker(
            title: store.storeName,
            subtitle: store.emoji,
            coordinate: CLLocationCoordinate2D(latitude: 37.59102042163005, longitude: 127.01930156305679))
        
        homeView.mapView.addAnnotation(marker)
    }
    
    
    // 카테고리 뷰 버튼
    @objc func goButtonDidTap(_ sender: UIButton) {
        let categoryVC = CategoryViewController()
        categoryVC.modalPresentationStyle = .overFullScreen
        categoryVC.modalTransitionStyle = .crossDissolve
        present(categoryVC, animated: true, completion: nil)
    }

}

