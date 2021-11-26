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
            
            $0.width.height.equalTo(37)
        }
    }
}
//
