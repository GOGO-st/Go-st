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
    
    init(title: String) {

        super.init(frame: CommonValue.shared.getButtonFrame())
        // 비활성화 상태로 초기화
        self.backgroundColor = R.color.disabled()
        self.layer.cornerRadius = self.frame.height / 2
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.isEnabled = false
    }
    
    func activate() {
        self.backgroundColor = R.color.point()
        self.isEnabled = true
    }
    
    func deactivate() {
        self.backgroundColor = R.color.disabled()
        self.isEnabled = false
    }
}
