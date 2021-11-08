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
    
    // MARK: - 이메일 (고정)
    private let emailDefaultLabel = UILabel().then {
        $0.text = "이메일"
        $0.textColor = .white
    }
    
    private let emailBackground = UIView().then {
        $0.backgroundColor = .black
    }
    // 이메일@gmail.com
    private let emailLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .white
    }
    
    // MARK: - 비번
    private let passwordDefaultLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.textColor = .white
    }
    
    private let passwordBackground = UIView().then {
        $0.backgroundColor = .black
    }
    
    private let passwordTextField = UITextField().then {
        $0.textColor = .white
        $0.placeholder = "비밀번호 입력"
        $0.keyboardType = .emailAddress
    }
    
    // MARK: - 비번 확인
    private let passwordConfirmDefaultLabel = UILabel().then {
        $0.text = "비밀번호 확인"
        $0.textColor = .white
    }
    
    private let passwordConfirmBackground = UIView().then {
        $0.backgroundColor = .black
    }
    
    private let passwordConfirmTextField = UITextField().then {
        $0.textColor = .white
        $0.placeholder = "비밀번호 확인"
        $0.keyboardType = .emailAddress
    }
    
    private let sideSpacing: CGFloat = 33
    private let topSpacing: CGFloat = 25
    private let height: CGFloat = 46
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addContentView()
        self.setAutoLayout()
        
        self.passwordTextField.delegate = self
        self.passwordConfirmTextField.delegate = self
        
        passwordConfirmTextField.addTarget(self, action: #selector(checkValidity), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(emailDefaultLabel)
        self.addSubview(emailBackground)
        emailBackground.addSubview(emailLabel)
        
        self.addSubview(passwordDefaultLabel)
        self.addSubview(passwordBackground)
        passwordBackground.addSubview(passwordTextField)
        
        self.addSubview(passwordConfirmDefaultLabel)
        self.addSubview(passwordConfirmBackground)
        passwordConfirmBackground.addSubview(passwordConfirmTextField)
    }
    
    private func setAutoLayout() {
        super.stepBar.snp.makeConstraints {
            $0.width.equalTo(super.WIDTH)
        }
        
        // 이메일
        emailDefaultLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(100)
            $0.left.equalTo(self).offset(self.sideSpacing)
        }
        
        emailBackground.snp.makeConstraints {
            $0.top.equalTo(emailDefaultLabel.snp.bottom).offset(self.topSpacing)
            $0.left.equalTo(self).offset(self.sideSpacing)
            $0.right.equalTo(self).offset(-self.sideSpacing)
            $0.height.equalTo(self.height)
        }
        
        emailLabel.snp.makeConstraints {
            $0.centerY.equalTo(emailBackground)
            $0.left.equalTo(emailBackground).offset(self.sideSpacing)
        }
        
        // 비번
        passwordDefaultLabel.snp.makeConstraints {
            $0.top.equalTo(emailBackground.snp.bottom).offset(self.topSpacing)
            $0.left.equalTo(self).offset(self.sideSpacing)
        }
        
        passwordBackground.snp.makeConstraints {
            $0.top.equalTo(passwordDefaultLabel.snp.bottom).offset(self.topSpacing)
            $0.left.equalTo(self).offset(self.sideSpacing)
            $0.right.equalTo(self).offset(-self.sideSpacing)
            $0.height.equalTo(self.height)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerY.equalTo(passwordBackground)
            $0.left.equalTo(passwordBackground).offset(self.sideSpacing)
        }
        
        // 비번 확인
        passwordConfirmDefaultLabel.snp.makeConstraints {
            $0.top.equalTo(passwordBackground.snp.bottom).offset(self.topSpacing)
            $0.left.equalTo(self).offset(self.sideSpacing)
        }
        
        passwordConfirmBackground.snp.makeConstraints {
            $0.top.equalTo(passwordConfirmDefaultLabel.snp.bottom).offset(self.topSpacing)
            $0.left.equalTo(self).offset(self.sideSpacing)
            $0.right.equalTo(self).offset(-self.sideSpacing)
            $0.height.equalTo(self.height)
        }
        
        passwordConfirmTextField.snp.makeConstraints {
            $0.centerY.equalTo(passwordConfirmBackground)
            $0.left.equalTo(passwordConfirmBackground).offset(self.sideSpacing)
        }
    }
    
    func setEmailLabel(_ email: String) {
        self.emailLabel.text = email
    }
    
    @objc
    private func checkValidity(_ textField: UITextField) {
        // 일단 2 이상으로
        
        let confirmText = textField.text
        if confirmText?.count ?? 0 > 1 && passwordTextField.text == confirmText {
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
