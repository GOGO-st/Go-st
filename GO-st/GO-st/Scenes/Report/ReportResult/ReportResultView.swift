//
//  ReportResultView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit
import Then
import SnapKit

final class ReportResultView: UIView {
    
    // 항상 고정
    private let location = LabelLabelView().then {
        $0.titleLabel.text = "장소 위치"
    }
    
    private let placeNameLabel = LabelLabelView().then {
        $0.titleLabel.text = "장소 이름"
    }
    
    // 지도에서 선택할 때만
    private let placeNameTextField = LabelTextFieldView().then {
        $0.titleLabel.text = "장소 이름"
        $0.isHidden = true
    }
    
    // 제목
    private let title = LabelTextFieldView().then {
        $0.titleLabel.text = "제목"
    }
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = R.color.background()
        self.addContentView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        addSubview(location)
        addSubview(placeNameTextField)
        addSubview(placeNameLabel)
        addSubview(title)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        
        location.snp.makeConstraints {
            $0.top.equalTo(self).offset(30)
            $0.left.right.equalTo(self)
        }
        
        placeNameLabel.snp.makeConstraints {
            $0.top.equalTo(location.snp.bottom).offset(20)
            $0.left.right.equalTo(self)
        }
        
        placeNameTextField.snp.makeConstraints {
            $0.top.equalTo(location.snp.bottom).offset(20)
            $0.left.right.equalTo(self)
        }
        title.snp.makeConstraints {
            $0.top.equalTo(placeNameLabel.snp.bottom).offset(20)
            $0.left.right.equalTo(self)
        }
    }
}
