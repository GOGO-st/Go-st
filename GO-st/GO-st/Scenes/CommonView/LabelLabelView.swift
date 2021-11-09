//
//  LabelLabelView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/09.
//

import UIKit
import Then
import SnapKit

// 고정뷰
final class LabelLabelView: UIView {
    
    // 제목
    private let titleLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .white
    }

    private let backgroundView = UIView().then {
        $0.backgroundColor = .black
    }
    // 내용
    private let contentLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .white
    }
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = 92
    private let sideSpacing: CGFloat = 26
    
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
        backgroundView.addSubview(contentLabel)
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
            $0.height.equalTo(59)
        }
        // 내용
        contentLabel.snp.makeConstraints {
            $0.centerY.equalTo(backgroundView)
            $0.left.equalTo(backgroundView).offset(self.sideSpacing)
        }
    }
    
    func setTitle(_ title: String) {
        self.titleLabel.text = title
    }
    
    func setText(_ text: String) {
        self.contentLabel.text = text
    }
}


