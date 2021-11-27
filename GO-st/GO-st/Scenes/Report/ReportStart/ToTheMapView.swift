//
//  ToTheMapView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/06.
//

import UIKit
import Then
import SnapKit

final class ToTheMapView: UIView {
    
    private let fixLabel = UILabel().then {
        $0.text = "찾는 장소가 안보여요"
        $0.font = R.font.notoSansKRRegular(size: 14)
        $0.textColor = .white
    }
    
    let goToTheMapButton = UIButton().then {
        $0.setImage(R.image.report.btnMap(), for: .normal)
    }
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = 66
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addContentView()
        self.setAutoLayout()
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(fixLabel)
        self.addSubview(goToTheMapButton)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        fixLabel.snp.makeConstraints {
            $0.left.equalTo(self).offset(20)
            $0.centerY.equalTo(self.snp.centerY)
        }
        goToTheMapButton.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.right.equalTo(self).offset(-20)
        }
    }
    
    func setFrame(_ y: CGFloat) {
        self.frame.origin.y = y
    }
}
