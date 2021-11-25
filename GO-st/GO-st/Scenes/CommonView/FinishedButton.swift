//
//  FinishedButton.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/16.
//

import UIKit


class FinishedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(title: String, type: CustomButtonType) {

        super.init(frame: CommonValue.shared.getButtonFrame(type))
        
        print("완료 버튼 프레임 \(self.frame) \(CommonValue.shared.tabBarHeight)")
        // 비활성화 상태로 초기화
        self.backgroundColor = R.color.disabled()
        self.layer.cornerRadius = self.frame.height * 0.214
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = R.font.notoSansKRMedium(size: 16)
        self.isEnabled = false
    }
    
    func activate() {
        self.backgroundColor = R.color.point()
        self.setTitleColor(.black, for: .normal)
        self.isEnabled = true
    }
    
    func deactivate() {
        self.backgroundColor = R.color.disabled()
        self.setTitleColor(.white, for: .normal)
        self.isEnabled = false
    }
    
    func buttonUp(_ y: CGFloat) {
        self.frame.origin.y = CommonValue.shared.buttonOriginY - y
    }
    
    func buttonDown() {
        self.frame.origin.y = CommonValue.shared.buttonOriginY
    }
}
