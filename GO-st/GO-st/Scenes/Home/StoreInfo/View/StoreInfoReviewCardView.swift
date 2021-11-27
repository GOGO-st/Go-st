//
//  StoreInfoReviewCardView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/27.
//

import UIKit
import Then
import SnapKit

class StoreInfoReviewCardView: StoreInfoCardView {
    
    let heartButton = UIButton().then {
        $0.setImage(R.image.icon.icNonHeart(), for: .normal)
        $0.setImage(R.image.icon.icHeart(), for: .selected)
    }
    
    let reviewButton = UIButton().then {
        $0.setImage(R.image.home.btnReview(), for: .normal)
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
        self.addSubview(reviewButton)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.height.equalTo(HEIGHT)
        }
        
        heartButton.snp.makeConstraints {
            $0.left.equalTo(self).offset(17)
            $0.bottom.equalTo(self).offset(-26)
        }
        
        reviewButton.snp.makeConstraints {
            $0.right.equalTo(self).offset(-17)
            $0.bottom.equalTo(self).offset(-16)
        }
        
    }
    
//    func setCell() {
//
//    }
}
