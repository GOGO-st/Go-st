//
//  SignUpOTPView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit
import Then
import SnapKit

final class SignUpOTPView: SignInUpView {
    
    // 나중에 NSAttribute로 이메일만 굵기 변경
    private let descriptionLabel = UILabel().then {
        $0.text = "(이메일)로\n발송된 번호를 입력해주세요"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 12)
        $0.numberOfLines = 2
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
        self.addSubview(descriptionLabel)
    }
    
    private func setAutoLayout() {
        super.stepBar.snp.makeConstraints {
            $0.width.equalTo(super.WIDTH / 3 * 2)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(100)
            $0.centerX.equalToSuperview()
        }
    }
}
