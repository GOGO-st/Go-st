//
//  SignUpPasswordView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit
import Then
import SnapKit

final class SignUpPasswordView: SignInUpView {
    
    // 이메일 (고정)
    private let emailView = LabelLabelView().then {
        $0.titleLabel.text = "이메일"
    }
    // 비번
    private let passwordView = LabelTextFieldView().then {
        $0.titleLabel.text = "비밀번호"
        $0.contentTextField.placeholder = "비밀번호 입력"
    }
    // 비번 확인
    
    private let passwordConfirmView = LabelTextFieldView().then {
        $0.titleLabel.text = "비밀번호 확인"
        $0.contentTextField.placeholder = "비밀번호 다시 입력"
    }
    
    private let sideSpacing: CGFloat = 33
    private let topSpacing: CGFloat = 25
    private let height: CGFloat = 46
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addContentView()
        self.setAutoLayout()
        
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
    }
    
    private func setAutoLayout() {
        super.stepBar.snp.makeConstraints {
            $0.width.equalTo(super.WIDTH)
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
    }
    
    func setEmailLabel(_ email: String) {
        self.emailView.contentLabel.text = email
    }
    
    @objc
    private func checkValidity(_ textField: UITextField) {
        // 일단 2 이상으로
        let confirmText = textField.text
        if confirmText?.count ?? 0 > 1 && passwordView.contentTextField.text == confirmText {
            super.canIUseNextButton(true)
        } else {
            super.canIUseNextButton(false)
        }
    }
}
extension SignUpPasswordView: UITextFieldDelegate {
    // 아무데나 누르면 키보드 내려가기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
    // return 누르면 키보드 내려가기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
