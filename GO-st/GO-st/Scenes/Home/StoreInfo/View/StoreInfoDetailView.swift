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
    
    let infoCard = StoreInfoReviewCardView()
    
    let listView = UIView().then {
        $0.backgroundColor = R.color.background()
    }
    let reviewListView = ReviewListView().then {
        $0.setType(.report)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addContentView()
        self.setAutoLayout()
        self.setMap()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
//        addSubview(scrollView)
//        scrollView.addSubview(containerView)
//        containerView.addSubview(mapView)
//        containerView.addSubview(listView)
        addSubview(mapView)
        addSubview(listView)
        listView.addSubview(reviewListView)
        
        addSubview(infoCard)
    }
    
    private func setAutoLayout() {
        
//        scrollView.snp.makeConstraints {
//            $0.edges.equalTo(0)
//        }
//
//        containerView.snp.makeConstraints {
//            $0.edges.equalTo(0)
//            $0.width.equalTo(frame.width)
//            $0.height.equalTo(CommonValue.shared.HEIGHT + 200)
//        }
        
        mapView.snp.makeConstraints {
            $0.top.left.right.equalTo(self)
            $0.height.equalTo(CommonValue.shared.HEIGHT * 0.5) //0.51
        }
        
        infoCard.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.left.equalTo(self).offset(14)
            $0.right.equalTo(self).offset(-15)
            $0.height.equalTo(135)
        }
        listView.snp.makeConstraints {
            $0.top.equalTo(mapView.snp.bottom)
            $0.left.right.bottom.equalTo(self)
        }
        
        reviewListView.snp.makeConstraints {
            $0.top.equalTo(listView).offset(60)
            $0.left.right.bottom.equalTo(listView)
        }
    }
    
    private func setMap() {
        mapView.showsUserLocation = true // 위치 보기 설정
    }
}
