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
    let titleLabel = UILabel().then {
        $0.text = ""
        $0.font = R.font.notoSansKRBold(size: 16)
        $0.textColor = .white
    }

    private let backgroundView = UIView().then {
        $0.backgroundColor = R.color.semiBlack()
//        $0.layer.borderColor = R.color.semiBlack()?.cgColor
//        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 4
    }
    
    // 내용
    let contentLabel = UILabel().then {
        $0.text = ""
        $0.font = R.font.notoSansKRRegular(size: 14)
        $0.textColor = UIColor(white: 1, alpha: 0.38)
    }
    
    // 인증완료
    let completeLabel = UILabel().then {
        $0.text = "인증완료"
        $0.font = R.font.notoSansKRRegular(size: 12)
        $0.textColor = R.color.point()
        $0.isHidden = true
    }
    
//    private let WIDTH: CGFloat = UIScreen.main.bounds.width - 65
    private let HEIGHT: CGFloat = 78
    private let sideSpacing: CGFloat = 20
    
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
        backgroundView.addSubview(completeLabel)
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
        
        backgroundView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.left.right.bottom.equalTo(self)
            $0.height.equalTo(44)
        }
        // 내용
        contentLabel.snp.makeConstraints {
            $0.centerY.equalTo(backgroundView)
            $0.left.equalTo(backgroundView).offset(sideSpacing)
        }
        // 인증완료
        completeLabel.snp.makeConstraints {
            $0.centerY.equalTo(backgroundView)
            $0.right.equalTo(backgroundView).offset(-sideSpacing)
        }
    }
    
//    func activate() {
//        self.layer.borderColor = R.color.point()?.cgColor
//    }
//
//    func deactivate() {
//        self.layer.borderColor = R.color.semiBlack()?.cgColor
//    }
    
//    func setTitle(_ title: String) {
//        self.titleLabel.text = title
//    }
//
//    func setText(_ text: String) {
//        self.contentLabel.text = text
//    }
    
    func setBackgroundColor() {
        self.backgroundView.backgroundColor = R.color.background()
    }
}


