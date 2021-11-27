//
//  StoreInfoDetailViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/19.
//

import UIKit
import Then
import SnapKit
import MapKit

class StoreInfoDetailViewController: UIViewController {
    
    let detailView = StoreInfoDetailView()
    
//    let center = CLLocationCoordinate2D(latitude: 37.66906773682083, longitude: 126.78460869875774)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("안뇽 여긴 디테일뷰")
        view.backgroundColor = R.color.background()
        
        self.view.addSubview(detailView)
        
        detailView.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.top.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.left.right.bottom.equalToSuperview()
        }
        detailView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func bind(_ data: DetailStoreData) {
        detailView.infoCard.storeLabel.text = data.storeName
        detailView.infoCard.addressLabel.text = data.address
        setInitialLocation(center: data.coordinate)
        setMarker(marker: Marker(title: data.storeName,
                            locationName: data.address,
                            discipline: data.emoji,
                            coordinate: data.coordinate))
        detailView.reviewListView.setCount(data.count)
    }
    
    private func setInitialLocation(center: CLLocationCoordinate2D?) {
        detailView.mapView.centerToLocation(center!, regionRadius: 150)
    }
    
    private func setMarker(marker: Marker) {
        detailView.mapView.addAnnotation(marker)
        detailView.mapView.register(MarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    }
}
