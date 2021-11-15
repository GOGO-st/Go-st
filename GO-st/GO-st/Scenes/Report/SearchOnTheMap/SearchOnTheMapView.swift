//
//  SearchOnTheMapView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/06.
//

import UIKit
import Then
import SnapKit
import MapKit

final class SearchOnTheMapView: UIView {

    private let fixLabel = UILabel().then {
        $0.text = "내가 갔던 장소는 바로 여기!"
    }
    
    let backgroundView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    let addressLabel = UILabel().then {
        $0.text = "하이염"
        $0.textColor = .darkGray
    }
    
    let nextButton = UIButton().then {
        $0.setTitle("이 위치로 주소 설정", for: .normal)
        $0.backgroundColor = .darkGray
    }
    let mapView = MKMapView()
    
    let marker = UIImageView().then {
        $0.image = R.image.map.defaultMarker() // 임시임
    }
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addContentView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(fixLabel)
        self.addSubview(mapView)
        self.addSubview(marker)
        self.addSubview(backgroundView)
        backgroundView.addSubview(addressLabel)
        self.addSubview(nextButton)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        // 내가 갔던
        fixLabel.snp.makeConstraints {
            $0.top.left.equalTo(self).offset(20)
        }
        mapView.snp.makeConstraints {
            $0.top.equalTo(fixLabel.snp.bottom).offset(20)
            $0.left.right.equalTo(self)
        }
        // 지도 마커
        marker.snp.makeConstraints {
            $0.top.left.equalTo(mapView).offset(200)
            $0.width.equalTo(61)
            $0.height.equalTo(66)
        }
        // 주소 배경
        backgroundView.snp.makeConstraints {
            $0.top.equalTo(mapView.snp.bottom).offset(10)
            $0.left.equalTo(self).offset(20)
            $0.right.equalTo(self).offset(-20)
            $0.height.equalTo(40)
        }
        // 주소
        addressLabel.snp.makeConstraints {
            $0.left.equalTo(backgroundView).offset(10)
            $0.centerY.equalTo(backgroundView)
        }
        // 완료
        nextButton.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.top.equalTo(backgroundView.snp.bottom).offset(20)
            $0.bottom.equalTo(self).offset(-20)
        }
    }
}
