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
        $0.text = "경험 제보"
        $0.textColor = .white
    }
    
    let leftButton = UIButton().then {
        $0.setTitle("이전", for: .normal)
        $0.backgroundColor = .blue
//        $0.isHidden = true
    }
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = 40
    
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
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        titleLabel.snp.makeConstraints {
            $0.center.equalTo(self)
        }
        leftButton.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.left.equalTo(self).offset(20)
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
