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
        $0.font = R.font.notoSansKRBold(size: 16)
    }
    
    let backgroundView = UIView().then {
        $0.backgroundColor = R.color.semiBlack()
        $0.layer.cornerRadius = 8
    }
    
    let addressLabel = UILabel().then {
        $0.font = R.font.notoSansKRRegular(size: 14)
        $0.textColor = .white
    }
    
    let nextButton = FinishedButton(title: "이 위치에 흔적 남기기", type: .report).then {
        $0.activate()
    }
    
    let mapView = MKMapView()
    
    let marker = UIImageView().then {
        $0.image = R.image.map.marker.imgSpotGostMark() // 임시임
    }
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addContentView()
        self.setAutoLayout()
        self.backgroundColor = R.color.darkGrey()
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
            $0.top.equalTo(self).offset(42)
            $0.left.equalTo(self).offset(20)
        }
        mapView.snp.makeConstraints {
            $0.top.equalTo(fixLabel.snp.bottom).offset(24)
            $0.left.right.equalTo(self)
            $0.width.height.equalTo(CommonValue.shared.WIDTH)
        }
        // 지도 마커
        marker.snp.makeConstraints {
//            $0.top.left.equalTo(mapView).offset(200)
            $0.center.equalTo(self)
            $0.width.equalTo(48)
            $0.height.equalTo(52)
        }
        // 주소 배경
        backgroundView.snp.makeConstraints {
            $0.top.equalTo(mapView.snp.bottom).offset(24)
            $0.left.equalTo(self).offset(20)
            $0.right.equalTo(self).offset(-20)
            $0.height.equalTo(44)
        }
        // 주소
        addressLabel.snp.makeConstraints {
            $0.left.equalTo(backgroundView).offset(20)
            $0.centerY.equalTo(backgroundView)
        }
        // 완료
//        nextButton.snp.makeConstraints {
//            $0.centerX.equalTo(self)
//            $0.top.equalTo(backgroundView.snp.bottom).offset(20)
//            $0.bottom.equalTo(self).offset(-20)
//        }
    }
}
