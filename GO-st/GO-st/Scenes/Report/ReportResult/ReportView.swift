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
    
    private let containerView = UIView()
    
    // 항상 고정
    let location = LabelLabelView().then {
        $0.titleLabel.text = "장소 위치"
    }
    
    // 장소 이름
    
    // 제목
    let title = LabelTextFieldView().then {
        $0.titleLabel.text = "제목"
//        $0.contentTextField.placeholder = "제목 작성"
    }
    
    let finishedButton = FinishedButton(title: "작성 완료", type: .report)
    
    
//    private let WIDTH: CGFloat = UIScreen.main.bounds.width
//    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
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
        scrollView.addSubview(containerView)
        containerView.addSubview(location)
        containerView.addSubview(title)
        
        addSubview(finishedButton)
    }
    
    private func setAutoLayout() {
//        self.snp.makeConstraints {
//            $0.width.equalTo(self.WIDTH)
//            $0.height.equalTo(self.HEIGHT)
//        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(0)
            $0.width.equalTo(frame.width)
            $0.height.equalTo(CommonValue.shared.HEIGHT + 200)
        }
        location.snp.makeConstraints {
            $0.top.equalTo(self).offset(30)
            $0.left.right.equalTo(self)
        }
        
        title.snp.makeConstraints {
            $0.top.equalTo(location.snp.bottom).offset(148)
            $0.left.right.equalTo(self)
        }
        
//        finishedButton.frame = CommonValue.shared.getButtonFrame()
//        finishedButton.snp.makeConstraints {
//            $0.left.equalTo(self).offset(32)
//            $0.right.equalTo(self).offset(-33)
//            $0.bottom.equalTo(self).offset(-100)
//            $0.height.equalTo(finishedButton.snp.width).multipliedBy(52/310)
//        }
    }
}
