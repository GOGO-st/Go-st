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
        $0.setPlaceholder("알파벳 대소문자 숫자 특수기호 12자 이내")
    }
    // 비번 확인
    private let passwordConfirmView = LabelTextFieldView().then {
        $0.titleLabel.text = "비밀번호 확인"
        $0.setPlaceholder("알파벳 대소문자 숫자 특수기호 12자 이내")
    }
    
    // caution 에셋 요청하기
    let confirm = UILabel().then {
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
    
    func setEmailLabel(_ email: String) {
        self.emailView.contentLabel.text = email
    }
    
    @objc
    private func checkValidity(_ textField: UITextField) {
        // 일단 2 이상으로
        let confirmText = textField.text
        if confirmText?.count ?? 0 > 1 && passwordView.contentTextField.text == confirmText {
            self.confirm.isHidden = true
            super.canIUseNextButton(true)
        } else {
            self.confirm.isHidden = false
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
