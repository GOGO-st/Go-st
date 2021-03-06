//
//  NavigationTitleView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/06.
//

import UIKit
import Then
import SnapKit

final class NavigationTitleView: UIView {
    
    private let titleLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .white
        $0.font = R.font.notoSansKRRegular(size: 22)
    }
    
    let leftButton = UIButton().then {
        $0.setImage(R.image.icon.icBack(), for: .normal)
    }
    
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
        self.addSubview(titleLabel)
        self.addSubview(leftButton)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(CommonValue.shared.WIDTH)
            $0.height.equalTo(CommonValue.shared.naviTitleHeight)
        }
        titleLabel.snp.makeConstraints {
            $0.center.equalTo(self)
        }
        leftButton.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.left.equalTo(self).offset(20)
            $0.width.height.equalTo(32)
        }
    }
    
    func setTitle(_ title: String) {
        self.titleLabel.text = title
    }
    
    func setButtonImage(_ image: String) {
        self.leftButton.setImage(UIImage(named: image), for: .normal)
    }
    
    func setBackgroundColor(_ color: UIColor) {
        self.backgroundColor = color
    }
}
