//
//  SignInView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/25.
//

import UIKit
import Then
import SnapKit

final class SignInView: SignInUpView {
    
    // 이메일
    private let emailView = LabelTextFieldView().then {
        $0.titleLabel.text = "이메일"
        $0.setPlaceholder("학교 이메일")
    }
    // 비번 확인
    private let passwordConfirmView = LabelTextFieldView().then {
        $0.titleLabel.text = "비밀번호"
//        $0.setPlaceholder("알파벳 대소문자 숫자 특수기호 12자 이내")
        $0.contentTextField.isSecureTextEntry = true
    }
    
    // caution 에셋 요청하기 - uiview로 묶기
    private let confirm = UILabel().then {
        $0.text = "일치하지 않습니다!"
        $0.textColor = R.color.point()
        $0.font = R.font.notoSansKRRegular(size: 12)
        $0.isHidden = true
    }
    
    private let sideSpacing: CGFloat = 33
    private let topSpacing: CGFloat = 25
    private let height: CGFloat = 46
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addContentView()
        self.setAutoLayout()
        
        super.nextButton.setTitle("회원가입 완료", for: .normal)
        self.passwordView.contentTextField.delegate = self
        self.passwordConfirmView.contentTextField.delegate = self
        
        self.passwordConfirmView.contentTextField.addTarget(self, action: #selector(checkValidity), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(emailView)
        self.addSubview(passwordView)
        self.addSubview(passwordConfirmView)
        self.addSubview(confirm)
    }
    
    private func setAutoLayout() {
        super.stepBar.snp.makeConstraints {
            $0.width.equalTo(CommonValue.shared.WIDTH)
        }
        
        // 이메일
        emailView.snp.makeConstraints {
            $0.top.equalTo(self).offset(100)
            $0.left.right.equalTo(self)
        }
        // 비번
        passwordView.snp.makeConstraints {
            $0.top.equalTo(emailView.snp.bottom).offset(self.topSpacing)
            $0.left.right.equalTo(self)
        }
        // 비번 확인
        passwordConfirmView.snp.makeConstraints {
            $0.top.equalTo(passwordView.snp.bottom).offset(self.topSpacing)
            $0.left.right.equalTo(self)
        }
        confirm.snp.makeConstraints {
            $0.top.equalTo(passwordConfirmView.snp.bottom).offset(6)
            $0.left.equalTo(self).offset(32)
        }
    }
}
