//
//  CustomTabBarCell.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/26.
//

import UIKit
import Then
import SnapKit

class CustomTabBarCell: UICollectionViewCell {
    
    static let identifier = "CustomTabBarCell"
    
    let WIDTH = UIScreen.main.bounds.width / 2
    let HEIGHT = 29
    
    let tabLabel = UILabel().then {
        $0.text = "내가 쓴 흔적"
        $0.font = R.font.notoSansKRBold(size: 16)
        $0.textColor = UIColor(white: 1, alpha: 0.78)
    }
    let underBar = UIView().then {
        $0.backgroundColor = R.color.point()
        $0.isHidden = true
    }
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
        self.addSubview(tabLabel)
        self.addSubview(underBar)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        tabLabel.snp.makeConstraints {
            $0.top.equalTo(self)
            $0.left.equalTo(self).offset(20)
        }
        underBar.snp.makeConstraints {
            $0.bottom.equalTo(self)
            $0.left.equalTo(tabLabel.snp.left)
            $0.width.equalTo(tabLabel.snp.width)
            $0.height.equalTo(2)
        }
    }
    
    func activate() {
        tabLabel.textColor = R.color.point()
        underBar.isHidden = false
    }
    
    func deactivate() {
        tabLabel.textColor = UIColor(white: 1, alpha: 0.78)
        underBar.isHidden = true
    }
}
