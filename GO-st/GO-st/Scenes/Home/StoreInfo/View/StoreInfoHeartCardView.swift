//
//  StoreInfoHeartCardView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/26.
//

import UIKit
import Then
import SnapKit

class StoreInfoHeartCardView: StoreInfoHomeCardView {
    
    let heartButton = UIButton().then {
        $0.setImage(R.image.icon.icHeart(), for: .normal)
        $0.setImage(R.image.icon.icNonHeart(), for: .selected)
    }
    
    private let HEIGHT: CGFloat = 119
    
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        setAutoLayout()
    }
    
    private func addContentView() {
        self.addSubview(heartButton)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.height.equalTo(HEIGHT)
        }
        
        heartButton.snp.makeConstraints {
            $0.left.equalTo(self).offset(21)
            $0.bottom.equalTo(self).offset(-21)
        }
        
    }
    
//    func setCell() {
//       
//    }
}
