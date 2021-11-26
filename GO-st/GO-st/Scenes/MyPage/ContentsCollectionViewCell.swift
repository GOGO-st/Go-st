//
//  ContentsCollectionViewCell.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/26.
//

import UIKit
import Then
import SnapKit

class ContentsCollectionViewCell: UICollectionViewCell {

    static let identifier = "ContentsCollectionViewCell"
    
    private let reviewList = ReviewListView()
    
    private let WIDTH = UIScreen.main.bounds.width
    private let HEIGHT = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        setAutoLayout()
        self.backgroundColor = R.color.background()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(reviewList)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        reviewList.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(self)
        }
    }
    
    func setCell(_ text: String) {
//        self.label.text = text
    }
}
