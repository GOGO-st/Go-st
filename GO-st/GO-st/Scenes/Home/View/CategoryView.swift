//
//  CategoryView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import Then
import SnapKit

class CategoryView: UIView {
    
    let goLabel = UILabel().then {
        $0.text = "어디 한 번 가보자고"
    }
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addContentView()
        self.setAutoLayout()
    }
    
    private func addContentView() {
        self.addSubview(goLabel)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        goLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(30)
            $0.centerX.equalTo(self)
        }
    }
}
