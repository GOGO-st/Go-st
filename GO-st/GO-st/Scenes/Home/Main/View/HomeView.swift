//
//  HomeView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/08.
//

import UIKit
import Then
import SnapKit
import MapKit
//import NMapsMap

final class HomeView: UIView {

    // 지도
//    let mapView = NMFMapView()
    let mapView = MKMapView()
    
    // 가보자고
    private lazy var goView = UIView().then {
        $0.backgroundColor = R.color.semiBlack()
        $0.layer.cornerRadius = 8 * goViewHeight / 64
    }
    
    private let goLabel = UILabel().then {
        $0.text = "흔적 찾아 떠나보자고!"
        $0.font = R.font.notoSansKRRegular(size: 20)
        $0.textColor = .white
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
    
    // 가게 정보 뷰
    let storeInfoView = StoreInfoCardView().then {
        $0.isHidden = true
    }
    
    private let goViewWidth = CommonValue.shared.WIDTH - 40
    private lazy var goViewHeight = goViewWidth * 64 / 335
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addContentView()
        self.setAutoLayout()
        
        mapView.showsUserLocation = true // 위치 보기 설정
        
        self.retrieveButton.isHidden = true
        self.retrieveButton.addTarget(self, action: #selector(retrieveButtonDidTap), for: .touchUpInside)
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
        
        // 가게 정보
        self.addSubview(storeInfoView)
    }
    
    private func setAutoLayout() {
//        let safeArea = self.safeAreaLayoutGuide
        
        // 지도
        mapView.snp.makeConstraints {
//            $0.top.equalToSuperview()
            $0.top.left.right.bottom.equalTo(self)
        }
        
        // 가보자고
        goView.snp.makeConstraints {
            $0.top.equalTo(self).offset(50)
            $0.centerX.equalTo(self)
            $0.width.equalTo(goViewWidth)
            $0.height.equalTo(goViewHeight)
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
            $0.centerX.equalTo(self)
            $0.width.equalTo(100)
        }
        
        // 가게 정보 뷰
        storeInfoView.snp.makeConstraints {
            $0.bottom.equalTo(self).offset(-10)
            $0.left.equalTo(self).offset(15)
            $0.right.equalTo(self).offset(-14)
        }
        
    }
    
    
    // 가게 재검색 뷰 숨기기
    func retrieveButtonIsHidden() {
        retrieveButton.isHidden.toggle()
    }
    
    @objc
    func retrieveButtonDidTap(_ sender: UIButton) {
        retrieveButtonIsHidden()
    }
}
