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

final class StoreInfoHomeCardView: StoreInfoCardView {
    
    let countView = EmojiCountView()
    
    private let HEIGHT: CGFloat = 125
    
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        setAutoLayout()
    }
    
    private func addContentView() {
        self.addSubview(countView)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.height.equalTo(HEIGHT)
        }
        
        countView.snp.makeConstraints {
            $0.right.bottom.equalTo(self).offset(-16)
        }
        
    }
    
    func bind(_ marker: MKAnnotation) {
        
        super.storeLabel.text = marker.title as? String
        super.addressLabel.text = marker.subtitle as? String
        // count
    }
    
    func activate() {
        self.isHidden = false
    }

    func deactivate() {
        self.isHidden = true
    }
}
