//
//  ReportResultView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit
import Then
import SnapKit

final class ReportResultView: ReportView {
    
    private let placeNameLabel = LabelTextFieldView().then {
        $0.titleLabel.text = "장소 이름"
        $0.contentTextField.backgroundColor = R.color.background()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = R.color.background()
        self.addContentView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        addSubview(placeNameLabel)
    }
    
    private func setAutoLayout() {
//        self.snp.makeConstraints {
//            $0.width.equalTo(self.WIDTH)
//            $0.height.equalTo(self.HEIGHT)
//        }
        placeNameLabel.snp.makeConstraints {
            $0.top.equalTo(super.location.snp.bottom).offset(20)
            $0.left.equalTo(self).offset(24)
            $0.right.equalTo(self).offset(-24)
        }
    }
    
    func setAddress(_ address: String) {
        super.location.contentLabel.text = address
    }
}
