//
//  HomeCategoryCollectionViewCell.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/28.
//

import UIKit
import Then
import SnapKit

class HomeCategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "HomeCategoryCollectionViewCell"
    
    private let background = UIView().then {
        $0.backgroundColor = R.color.background()
        $0.layer.cornerRadius = 8
    }
    
    private let containerView = UIView()
    
    private let emojiLabel = UILabel().then {
        $0.text = ""
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 25)
    }
    
    private let categoryLabel = UILabel().then {
        $0.text = ""
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = R.font.notoSansKRRegular(size: 14)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        setAutoLayout()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(background)
        background.addSubview(containerView)
        containerView.addSubview(emojiLabel)
        containerView.addSubview(categoryLabel)
    }
    
    private func setAutoLayout() {
        
        background.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        
        containerView.snp.makeConstraints {
            $0.center.equalTo(self)
        }
        emojiLabel.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.top.left.right.equalTo(containerView)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.top.equalTo(emojiLabel.snp.bottom).offset(6)
            $0.left.right.bottom.equalTo(containerView)
        }
    }
    func bind(data: CategoryModel) {
        self.emojiLabel.text = data.emoji
        self.categoryLabel.text = data.category
    }
}
