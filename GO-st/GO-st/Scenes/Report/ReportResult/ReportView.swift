//
//  ReportView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/16.
//

import UIKit
import Then
import SnapKit

class ReportView: UIView {
    
    private let scrollView = UIScrollView()
    
    private let contentsView = UIView()
    
    // 항상 고정
    private let location = LabelLabelView().then {
        $0.titleLabel.text = "장소 위치"
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
        addSubview(scrollView)
        scrollView.addSubview(contentsView)
        contentsView.addSubview(location)
        contentsView.addSubview(title)
    }
    
    private func setAutoLayout() {
//        self.snp.makeConstraints {
//            $0.width.equalTo(self.WIDTH)
//            $0.height.equalTo(self.HEIGHT)
//        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }
        
        contentsView.snp.makeConstraints {
            $0.edges.equalTo(0)
            $0.width.equalTo(frame.width)
            $0.height.equalTo(800)
        }
        location.snp.makeConstraints {
            $0.top.equalTo(self).offset(30)
            $0.left.right.equalTo(self)
        }
        
        title.snp.makeConstraints {
            $0.top.equalTo(location.snp.bottom).offset(109)
            $0.left.right.equalTo(self)
        }
    }
}
