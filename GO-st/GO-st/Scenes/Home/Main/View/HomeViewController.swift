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
    
    var storeName  = ""
    var address = ""
    var coordinate = CommonValue.shared.schoolCenter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setMap()
        self.setInitialLocation()
        
        homeView.goButton.addTarget(self, action: #selector(goButtonDidTap), for: .touchUpInside)
        homeView.storeInfoView.fullButton.addTarget(self, action: #selector(InfoViewDidTap), for: .touchUpInside)
        
        view.addSubview(homeView)
        homeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        homeView.mapView.addAnnotations(viewModel.stores)
        homeView.mapView.register(MarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    }
    
    
    // 카테고리 뷰 버튼
    @objc
    func goButtonDidTap(_ sender: UIButton) {
        let categoryVC = CategoryViewController()
        categoryVC.modalPresentationStyle = .overFullScreen
        categoryVC.modalTransitionStyle = .crossDissolve
        present(categoryVC, animated: true, completion: nil)
    }
    
    
    @objc
    func InfoViewDidTap() {
        print("가게 디테일 뷰로 가기")
        // 서버 연결
        let nextVC = StoreInfoDetailViewController()
        viewModel.detailStoreData = DetailStoreData(storeName: storeName,
                                                    address: address,
                                                    coordinate: coordinate,
                                                    emoji: "🥰")
        nextVC.bind(self.viewModel.detailStoreData!)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
