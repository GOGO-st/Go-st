//
//  SignUpFinishedView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit
import Then
import SnapKit

final class SignUpFinishedView: SignInUpView {
    
    private let emailLabel = UILabel().then {
        $0.text = "이메일"
        $0.textColor = .white
    }
    
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
        self.addSubview(emailLabel)
    }
    
    private func setAutoLayout() {
        super.stepBar.snp.makeConstraints {
            $0.width.equalTo(super.WIDTH)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(100)
            $0.centerX.equalToSuperview()
        }
    }
}
