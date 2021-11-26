//
//  StoreInfoDetailView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/19.
//

import UIKit
import Then
import SnapKit
import MapKit


class StoreInfoDetailView: UIView {
    
    let scrollView = UIScrollView()
    
    let containerView = UIView()
    
    let mapView = MKMapView()
    
    let listView = UIView().then {
        $0.backgroundColor = R.color.point()//background()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addContentView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(mapView)
        containerView.addSubview(listView)
    }
    
    private func setAutoLayout() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(0)
            $0.width.equalTo(frame.width)
            $0.height.equalTo(CommonValue.shared.HEIGHT + 200)
        }
        
        mapView.snp.makeConstraints {
            $0.top.left.right.equalTo(containerView)
            $0.height.equalTo(CommonValue.shared.HEIGHT * 0.56)
        }
        
        listView.snp.makeConstraints {
            $0.top.equalTo(mapView.snp.bottom)
            $0.left.right.bottom.equalTo(containerView)
        }
    }
    
    private func setMap() {
        mapView.showsUserLocation = true // 위치 보기 설정
    }
}
