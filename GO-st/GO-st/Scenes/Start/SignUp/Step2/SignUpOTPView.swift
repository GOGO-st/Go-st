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
    
    // NSAttribute로 이메일만 굵기 변경
    private let descriptionLabel = UILabel().then {
        $0.text = ""
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = R.font.notoSansKRBold(size: 16)
        $0.numberOfLines = 2
    }
    
    let otpTextField = OTPTextField().then {
        $0.configure()
    }
    
//    let againButton = FinishedButton(title: "다시 인증하기", type: .signUp).then {
//        $0.isEnabled = true
//    }
//
//    let finishedButton = FinishedButton(title: "인증 완료", type: .signUp)
    
    let againButton = UIButton().then {
        $0.setTitle("다시 인증하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = R.font.notoSansKRMedium(size: 16)
        $0.backgroundColor = R.color.disabled()
        $0.layer.cornerRadius = 12
    }
    
//    let finishedButton = UIButton().then {
//        $0.setTitle("인증 완료", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.titleLabel?.font = R.font.notoSansKRMedium(size: 16)
//        $0.backgroundColor = R.color.point()
//        $0.layer.cornerRadius = 12
//    }
    
    private let againLabel = UILabel().then {
        $0.text = "인증번호가 오지 않으면 다시 보내기를 눌러주세요"
        $0.font = R.font.notoSansKRMedium(size: 16)
        $0.textColor = UIColor(white: 1, alpha: 0.38)
    }
    
    private let buttonWidth: CGFloat = CommonValue.shared.WIDTH / 2 - 25
    private lazy var buttonHeight: CGFloat = 52 * buttonWidth / 162
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.otpTextField.delegate = self
        
        
        self.addContentView()
        self.setAutoLayout()
        
//        super.nextButton.isHidden = true
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
        self.addSubview(againButton)
//        self.addSubview(finishedButton)
        self.addSubview(againLabel)
    }
    
    private func setAutoLayout() {
        super.stepBar.snp.makeConstraints {
            $0.width.equalTo(CommonValue.shared.WIDTH / 3 * 2)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(146)
            $0.centerX.equalToSuperview()
        }
        otpTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(24)
            $0.left.equalTo(self).offset(43)
            $0.right.equalTo(self).offset(-42)
            $0.height.equalTo(61)
        }
        
        againButton.snp.makeConstraints {
            $0.left.equalTo(self).offset(20)
            $0.bottom.equalTo(againLabel.snp.top).offset(-20)
            $0.width.equalTo(buttonWidth)//(CommonValue.shared.WIDTH / 2 - 25)
            $0.height.equalTo(buttonHeight)//(againButton.snp.width).multipliedBy(52 / 162)
        }
        
//        finishedButton.snp.makeConstraints {
//            $0.left.equalTo(againButton.snp.right).offset(10)
//            $0.right.equalTo(self).offset(-20)
//            $0.bottom.equalTo(againLabel.snp.top).offset(-20)
//            $0.width.equalTo(againButton.snp.width)
//            $0.height.equalTo(againButton.snp.height)
//        }
        super.nextButton.snp.makeConstraints {
            $0.left.equalTo(againButton.snp.right).offset(10)
            $0.right.equalTo(self).offset(-20)
            $0.bottom.equalTo(againLabel.snp.top).offset(-20)
            $0.width.equalTo(againButton.snp.width)
            $0.height.equalTo(againButton.snp.height)
        }
        againLabel.snp.makeConstraints {
            $0.bottom.equalTo(self).offset(-42)
            $0.centerX.equalTo(self)
        }
    }
    
    func setEmailLabel(_ email: String) {
        self.descriptionLabel.text = "\(email)\n메일의 인증번호 6자리를 입력해주세요"
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
