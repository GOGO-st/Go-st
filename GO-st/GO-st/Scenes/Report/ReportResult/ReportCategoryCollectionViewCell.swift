//
//  ReportCategoryCollectionViewCell.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/28.
//

import UIKit
import Then
import SnapKit

class ReportCategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "ReportCategoryCollectionViewCell"
    
    private let background = UIView().then {
        $0.backgroundColor = R.color.background()
        $0.layer.cornerRadius = 8
    }
    
    private let emojiLabel = UILabel().then {
        $0.text = ""
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 30)
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
    }
    
    private func setAutoLayout() {
        
        background.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        
        emojiLabel.snp.makeConstraints {
            $0.center.equalTo(background)
        }
    }
    func bind(data: CategoryModel) {
        self.emojiLabel.text = data.emoji
    }
}
