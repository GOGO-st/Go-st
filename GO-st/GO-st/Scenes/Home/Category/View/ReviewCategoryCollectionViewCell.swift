//
//  ReviewCategoryCollectionViewCell.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/28.
//

import UIKit
import Then
import SnapKit

class ReviewCategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "ReviewCategoryCollectionViewCell"
    
    private let background = UIView().then {
        $0.backgroundColor = R.color.background()
        $0.layer.cornerRadius = 26
    }
    
    private let emojiLabel = UILabel().then {
        $0.text = ""
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 23)
    }
    
    private let categoryLabel = UILabel().then {
        $0.text = ""
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = R.font.notoSansKRRegular(size: 12)
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
        background.addSubview(emojiLabel)
        self.addSubview(categoryLabel)
    }
    
    private func setAutoLayout() {
        
        background.snp.makeConstraints {
            $0.top.left.right.equalTo(self)
        }
        
        emojiLabel.snp.makeConstraints {
            $0.center.equalTo(background)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.top.equalTo(background.snp.bottom).offset(8)
            $0.bottom.equalTo(self)
        }
    }
    func bind(data: CategoryModel) {
        self.emojiLabel.text = data.emoji
        self.categoryLabel.text = data.category
    }
    
    func selected() {
        background.backgroundColor = R.color.selected()
    }
    
    func deselected() {
        background.backgroundColor = R.color.background()
    }
}
