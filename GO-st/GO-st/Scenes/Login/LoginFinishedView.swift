//
//  LoginFinishedView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit
import Then
import SnapKit

final class LoginFinishedView: LoginView {
    
//    private let stepBar = UIView().then {
//        $0.backgroundColor = .orange
//    }
    
    private let emailLabel = UILabel().then {
        $0.text = "이메일"
        $0.textColor = .white
    }
    
//    let finishedButton = UIButton().then {
//        $0.backgroundColor = .orange
//        $0.setTitle("다음", for: .normal)
//        $0.tintColor = .black
//    }
//
//    private let WIDTH: CGFloat = UIScreen.main.bounds.width
//    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
        
        self.addContentView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
//        self.addSubview(stepBar)
        self.addSubview(emailLabel)
//        self.addSubview(finishedButton)
    }
    
    private func setAutoLayout() {
        
//        self.snp.makeConstraints {
//            $0.width.equalTo(self.WIDTH)
//            $0.height.equalTo(self.HEIGHT)
//        }
        super.stepBar.snp.makeConstraints {
            $0.width.equalTo(super.WIDTH)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(100)
            $0.centerX.equalToSuperview()
        }
        
//        finishedButton.snp.makeConstraints {
//            $0.left.equalTo(self).offset(20)
//            $0.right.bottom.equalTo(self).offset(-20)
//        }
    }
}
