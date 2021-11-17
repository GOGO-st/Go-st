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
        $0.text = ""
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18)
        $0.numberOfLines = 2
    }
    
    let otpTextField = OTPTextField().then {
        $0.configure()
    }
    
    private let againLabel = UILabel().then {
        $0.text = "인증번호가 오지 않았다면?"
        $0.textColor = .white
    }
    
    let againButton = UIButton().then {
        $0.setTitle("다시보내기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.otpTextField.delegate = self
        
        self.addContentView()
        self.setAutoLayout()
        
        super.nextButton.setTitle("인증 완료", for: .normal)
        otpTextField.addTarget(self, action: #selector(checkValidity), for: .editingChanged)
        
        otpTextField.didEnterLastDigit = {
            self.endEditing(true)
            print($0)
            super.canIUseNextButton(true)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(descriptionLabel)
        self.addSubview(otpTextField)
        self.addSubview(againLabel)
        self.addSubview(againButton)
    }
    
    private func setAutoLayout() {
        super.stepBar.snp.makeConstraints {
            $0.width.equalTo(CommonValue.shared.WIDTH / 3 * 2)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(100)
            $0.centerX.equalToSuperview()
        }
        otpTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(50)
            $0.left.equalTo(self).offset(43)
            $0.right.equalTo(self).offset(-42)
            $0.height.equalTo(61)
        }
        againLabel.snp.makeConstraints {
            $0.top.equalTo(otpTextField.snp.bottom).offset(20)
            $0.left.equalTo(self).offset(20)
        }
        againButton.snp.makeConstraints {
            $0.centerY.equalTo(againLabel.snp.centerY)
            $0.right.equalTo(self).offset(-20)
        }
    }
    
    func setEmailLabel(_ email: String) {
        let attributString = NSMutableAttributedString()
            .bold("\(email)에서", fontSize: 18)
            .normal("\n발송된 번호를 입력해주세요", fontSize: 18)
        
        self.descriptionLabel.attributedText = attributString
    }
    
    @objc
    private func checkValidity(_ textField: UITextField) {
        if textField.text?.count ?? 0 == 6 {
            super.canIUseNextButton(true)
        } else {
            super.canIUseNextButton(false)
        }
    }
}
extension SignUpOTPView: UITextFieldDelegate {
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
