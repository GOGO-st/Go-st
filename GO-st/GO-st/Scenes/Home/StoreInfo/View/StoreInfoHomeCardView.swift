//
//  StoreInfoHomeCardView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/26.
//

import UIKit
import Then
import SnapKit
import MapKit

final class StoreInfoHomeCardView: UIView {
    
    let backgroundView = UIView().then {
        $0.backgroundColor = R.color.semiBlack()
        $0.layer.cornerRadius = 8
    }
    
    let storeLabel = UILabel().then {
        $0.font = R.font.notoSansKRBold(size: 16)
        $0.textColor = .white
    }
    
    let addressLabel = UILabel().then {
        $0.font = R.font.notoSansKRRegular(size: 12)
        $0.textColor = UIColor(white: 1, alpha: 0.78)
    }
    
    let countView = EmojiCountView()
    
    let fullButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    private let HEIGHT: CGFloat = 125
    
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        setAutoLayout()
    }
    
    private func addContentView() {
        self.addSubview(backgroundView)
        self.addSubview(storeLabel)
        self.addSubview(addressLabel)
        self.addSubview(countView)
        self.addSubview(fullButton)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.height.equalTo(HEIGHT)
        }
        
        backgroundView.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(self)
        }
        
        storeLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(16)
            $0.left.equalTo(self).offset(17)
        }
        
        addressLabel.snp.makeConstraints {
            $0.top.equalTo(storeLabel.snp.bottom).offset(6)
            $0.left.equalTo(self).offset(17)
        }
        
        countView.snp.makeConstraints {
            $0.right.bottom.equalTo(self).offset(-16)
        }
        
        fullButton.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(self)
        }
    }
    
    func bind(_ marker: MKAnnotation) {
        
        self.storeLabel.text = marker.title as? String
        self.addressLabel.text = marker.subtitle as? String
        // count
    }
    
    func activate() {
        self.isHidden = false
    }
    
    func deactivate() {
        self.isHidden = true
    }
}
