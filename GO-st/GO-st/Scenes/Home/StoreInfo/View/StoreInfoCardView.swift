//
//  StoreInfoCardView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import Then
import SnapKit

final class StoreInfoCardView: UIView {
    
    let backgroundView = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 5
    }
    
    let storeLabel = UILabel().then {
        $0.text = "하이염"
    }
    
    let addressLabel = UILabel().then {
        $0.text = "서울시 종로구 ㅓ어쩌고"
    }
    
    let countLabel = UILabel().then {
        $0.text = "+ 11"
    }
    
    private let HEIGHT: CGFloat = 100
    
    required init?(coder: NSCoder) { super.init(coder: coder) }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        setAutoLayout()
    }
    
    private func addContentView() {
        self.addSubview(backgroundView)
        self.backgroundColor = .white
        self.addSubview(storeLabel)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.height.equalTo(HEIGHT)
        }
        
        backgroundView.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(self)
        }
        
        storeLabel.snp.makeConstraints {
            $0.top.left.equalTo(self).offset(20)
        }
    }
}
