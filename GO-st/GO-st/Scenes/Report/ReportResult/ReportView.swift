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
    
    let scrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    
    let containerView = UIView()
    
    // 항상 고정
    let location = LabelLabelView().then {
        $0.titleLabel.text = "장소 위치"
        $0.contentLabel.textColor = .white
        $0.setBackgroundColor()
    }
    
    // 장소 이름
    
    // 카테고리
    let categoryLabel = UILabel().then {
        $0.text = "카테고리"
        $0.font = R.font.notoSansKRBold(size: 16)
        $0.textColor = .white
    }
    
    let categoryButton = UIButton().then {
        $0.setImage(R.image.report.btnReviewPlus(), for: .normal)
    }
    
    // 제목
    let title = LabelTextFieldView().then {
        $0.titleLabel.text = "제목"
        $0.contentTextField.keyboardType = .default
        $0.contentTextField.backgroundColor = R.color.background()
    }
    
    let descriptionLabel = UILabel().then {
        $0.text = "설명"
        $0.font = R.font.notoSansKRBold(size: 16)
        $0.textColor = .white
    }
    
    let descriptionTextView = UITextView().then {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = R.color.background()
    }
    
    let emojiLabel = UILabel().then {
        $0.text = "설명"
        $0.font = R.font.notoSansKRBold(size: 16)
        $0.textColor = .white
    }
    
    let emojiTextField = CustomTextField().then {
        $0.layer.cornerRadius = 32
        $0.backgroundColor = R.color.background()
    }
    
    let finishedButton = FinishedButton(title: "작성 완료", type: .report)
    
    
//    private let WIDTH: CGFloat = UIScreen.main.bounds.width
//    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = R.color.darkGrey()
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
        containerView.addSubview(categoryLabel)
        containerView.addSubview(categoryButton)
        containerView.addSubview(title)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(descriptionTextView)
        containerView.addSubview(emojiLabel)
        containerView.addSubview(emojiTextField)
        addSubview(finishedButton)
    }
    
    private func setAutoLayout() {
//        self.snp.makeConstraints {
//            $0.width.equalTo(CommonValue.shared.WIDTH)
//            $0.height.equalTo(CommonValue.shared.HEIGHT)
//        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        containerView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(1200)
        }
        location.snp.makeConstraints {
            $0.top.equalTo(self).offset(30)
            $0.left.equalTo(self).offset(24)
            $0.right.equalTo(self).offset(-24)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(location.snp.bottom).offset(128)
            $0.left.equalTo(self).offset(24)
        }
        
        categoryButton.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(12)
            $0.left.equalTo(self).offset(25)
            $0.width.height.equalTo(72)
        }
        title.snp.makeConstraints {
            $0.top.equalTo(categoryButton.snp.bottom).offset(24)
            $0.left.equalTo(self).offset(24)
            $0.right.equalTo(self).offset(-24)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(24)
            $0.left.equalTo(self).offset(24)
        }
        
        descriptionTextView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(12)
            $0.left.equalTo(self).offset(24)
            $0.right.equalTo(self).offset(-24)
            $0.height.equalTo(130)
        }
        
        emojiLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionTextView.snp.bottom).offset(24)
            $0.left.equalTo(self).offset(24)
        }
        
        emojiTextField.snp.makeConstraints {
            $0.top.equalTo(emojiLabel.snp.bottom).offset(12)
            $0.left.equalTo(self).offset(24)
            $0.width.height.equalTo(64)
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
