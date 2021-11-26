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
    
    let center = CLLocation(latitude: 37.66906773682083, longitude: 126.78460869875774)
    
    
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
        
        
        detailView.mapView.centerToLocation(self.center)
    }
}
