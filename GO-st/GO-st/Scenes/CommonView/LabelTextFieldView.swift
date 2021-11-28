//
//  LabelTextFieldView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/09.
//

import UIKit
import Then
import SnapKit

// 텍스트 뷰
final class LabelTextFieldView: UIView {
    
    // 제목
    let titleLabel = UILabel().then {
        $0.text = ""
        $0.font = R.font.notoSansKRBold(size: 16)
        $0.textColor = .white
    }

//    private let backgroundView = UIView().then {
//        $0.backgroundColor = R.color.semiBlack()
//        $0.layer.borderColor = R.color.semiBlack()?.cgColor
//        $0.layer.borderWidth = 1
//        $0.layer.cornerRadius = 4
//    }
    // 내용
    let contentTextField = CustomTextField().then {
        $0.keyboardType = .emailAddress
    }
    
//    private let WIDTH: CGFloat = UIScreen.main.bounds.width - 65
    private let HEIGHT: CGFloat = 78
    private let sideSpacing: CGFloat = 33
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addContentView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(titleLabel)
//        self.addSubview(backgroundView)
        self.addSubview(contentTextField)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(CommonValue.shared.WIDTH)
            $0.height.equalTo(HEIGHT)
        }
        // 제목
        titleLabel.snp.makeConstraints {
            $0.top.left.equalTo(self)
        }
        
//        backgroundView.snp.makeConstraints {
//            $0.left.equalTo(self).offset(self.sideSpacing)
//            $0.right.equalTo(self).offset(-self.sideSpacing)
//            $0.bottom.equalTo(self)
//            $0.height.equalTo(46)
//        }
//        // 내용
//        contentTextField.snp.makeConstraints {
//            $0.centerY.equalTo(backgroundView)
//            $0.left.equalTo(backgroundView).offset(self.sideSpacing)
//        }
        
        contentTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.left.right.bottom.equalTo(self)
            $0.height.equalTo(44)
        }
    }
    
    func activate() {
        self.layer.borderColor = R.color.point()?.cgColor
    }
    
    func deactivate() {
        self.layer.borderColor = R.color.semiBlack()?.cgColor
    }
    
    func setPlaceholder(_ str: String) {
        contentTextField.setPlaceholderWithColor(str)
    }
//    func setTitle(_ title: String) {
//        self.titleLabel.text = title
//    }
    
//    func setText(_ text: String) {
//        self.contentLabel.text = text
//    }
}


