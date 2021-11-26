//
//  ReviewTableViewCell.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/26.
//

import UIKit
import Then
import SnapKit

class ReviewTableViewCell: UITableViewCell {
    
    static let identifier = "ReviewTableViewCell"
    
    private let emojiView = MarkerImageView(frame: .zero)
    
    private let storeLabel = UILabel().then {
        $0.font = R.font.notoSansKRBold(size: 14)
        $0.textColor = .white
    }
    
    private let dateLabel = UILabel().then {
        $0.font = R.font.notoSansKRRegular(size: 12)
        $0.textColor = UIColor(white: 1, alpha: 0.38)
    }
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = 10
    }
    
    
    private let titleLabel = UILabel().then {
        $0.font = R.font.notoSansKRBold(size: 14)
        $0.textColor = .white
        $0.numberOfLines = 0
    }
    
    private let descriptionLabel = UILabel().then {
        $0.font = R.font.notoSansKRRegular(size: 12)
        $0.textColor = UIColor(white: 1, alpha: 0.78)
        $0.numberOfLines = 0
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addContentView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(emojiView)
        self.addSubview(storeLabel)
        self.addSubview(dateLabel)
        self.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
    }
    
    private func setAutoLayout() {
        
        emojiView.snp.makeConstraints {
            $0.top.equalTo(self).offset(22)
            $0.left.equalTo(self).offset(20)
            $0.width.height.equalTo(37)
        }
        storeLabel.snp.makeConstraints {
            $0.top.equalTo(emojiView.snp.top)
            $0.left.equalTo(emojiView.snp.right).offset(12)
        }
        dateLabel.snp.makeConstraints {
            $0.bottom.equalTo(emojiView.snp.bottom)
            $0.left.equalTo(emojiView.snp.right).offset(12)
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(16)
            $0.left.equalTo(self).offset(20)
            $0.right.equalTo(self).offset(-20)
            $0.bottom.equalTo(self).offset(-22)
        }
    }
    
    func bind() {
        // 나중에 struct 받아서 bind
        
        self.storeLabel.text = "희미한고구마 님의 제보"
        self.dateLabel.text = ""
        self.titleLabel.text = "\" 벚꽃 피면 여기가 사진 맛집~~ \""
        self.descriptionLabel.text = "다들 학잠입고 사진 엄청 찍고 과별로 모여서 단체 사진도 많이 찍었던 걸로 기억해요! 새내기때 본관 나오게 사진 찍고 프사 바꿔본적 한번쯤은 있을듯 진심"
    }
}
//
