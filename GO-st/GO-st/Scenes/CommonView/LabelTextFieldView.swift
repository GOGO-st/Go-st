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
        $0.font = .boldSystemFont(ofSize: 17)
        $0.textColor = .white
    }

    let backgroundView = UIView().then {
        $0.backgroundColor = .black
    }
    // 내용
    let contentTextField = UITextField().then {
        $0.textColor = .white
        $0.placeholder = ""
        $0.font = .systemFont(ofSize: 16)
        $0.keyboardType = .emailAddress
    }
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = 89
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
        self.addSubview(backgroundView)
        backgroundView.addSubview(contentTextField)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(WIDTH)
            $0.height.equalTo(HEIGHT)
        }
        // 제목
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self)
            $0.left.equalTo(self).offset(self.sideSpacing)
        }
        
        backgroundView.snp.makeConstraints {
            $0.left.equalTo(self).offset(self.sideSpacing)
            $0.right.equalTo(self).offset(-self.sideSpacing)
            $0.bottom.equalTo(self)
            $0.height.equalTo(46)
        }
        // 내용
        contentTextField.snp.makeConstraints {
            $0.centerY.equalTo(backgroundView)
            $0.left.equalTo(backgroundView).offset(self.sideSpacing)
        }
    }
    
//    func setTitle(_ title: String) {
//        self.titleLabel.text = title
//    }
    
//    func setText(_ text: String) {
//        self.contentLabel.text = text
//    }
}


