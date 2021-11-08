//
//  SignUpEmailView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit
import Then
import SnapKit

final class SignUpEmailView: SignInUpView {

    private let helloLabel = UILabel().then {
        $0.text = "👀\n\n환영합니다"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 16)
        $0.numberOfLines = 3
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "입력한 이메일은 인증 과정에서만 사용해요"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 12)
    }
    
    // 이메일 적으면 이미지 갈아끼우기
//    let backgroundImage
    
    let emailTextField = UITextField().then {
        $0.placeholder = "학교 이메일을 적어주세요"
        $0.backgroundColor = .white
        $0.keyboardType = .emailAddress
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
        
        self.addContentView()
        self.setAutoLayout()
        
        self.emailTextField.delegate = self
        self.emailTextField.addTarget(self, action: #selector(checkValidity), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(helloLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(emailTextField)
    }
    
    private func setAutoLayout() {
        super.stepBar.snp.makeConstraints {
            $0.width.equalTo(super.WIDTH / 3)
        }
        helloLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(70)
            $0.centerX.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(helloLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    // 한글자라도 입력하면 버튼 활성화
    @objc
    private func checkValidity(_ textField: UITextField) {
        if textField.text?.count ?? 0 > 0 {
            super.canIUseNextButton(true)
        } else {
            super.canIUseNextButton(false)
        }
    }
}
extension SignUpEmailView: UITextFieldDelegate {
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
    func checkMaxLength(_ textfield: UITextField, maxLength: Int){
        if(textfield.text?.count ?? 0 > maxLength){
            textfield.deleteBackward()
            textfield.resignFirstResponder()
        }
    }
}
