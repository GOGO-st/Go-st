//
//  CategoryView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import Then
import SnapKit

final class CategoryView: UIView {
    
    private let goLabel = UILabel().then {
        $0.text = "흔적 찾아 떠나보자고!"
        $0.textColor = .white
        $0.font = R.font.notoSansKRRegular(size: 20)
    }
    
    let backButton = UIButton().then {
        $0.setTitle("엑스", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        
    }
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = R.color.semiBlack()
        self.addContentView()
        self.setAutoLayout()
        
        
    }
    
    private func addContentView() {
        self.addSubview(goLabel)
        self.addSubview(backButton)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        goLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(68)
            $0.centerX.equalTo(self)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(80)
            $0.left.equalToSuperview().offset(20)
        }
    }
    
    
}
