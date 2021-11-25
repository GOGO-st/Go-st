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
        $0.text = "학교 이메일을 입력하세요"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = R.font.notoSansKRBold(size: 16)
        $0.numberOfLines = 3
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "입력한 이메일은 인증 과정에서만 사용해요"
        $0.textAlignment = .center
        $0.textColor = UIColor(white: 1, alpha: 0.58)
        $0.font = R.font.notoSansKRRegular(size: 12)
    }
    
    // 이메일 적으면 이미지 갈아끼우기
//    let backgroundImage
    
    let emailTextField = CustomTextField().then {
        $0.setPlaceholderWithColor("학교 이메일을 적어주세요")
        $0.keyboardType = .emailAddress
    }
    
    private let sideSpacing: CGFloat = 24
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addContentView()
        self.setAutoLayout()
        
        self.emailTextField.delegate = self
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
            $0.width.equalTo(CommonValue.shared.WIDTH / 3)
        }
        helloLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(146)
            $0.centerX.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(helloLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(40)
            $0.left.equalTo(self).offset(sideSpacing)
            $0.right.equalTo(self).offset(-sideSpacing)
            $0.height.equalTo(44)
        }
    }
    
    
    
    // 이메일 얻기
    func getEmail() -> String {
        return self.emailTextField.text ?? ""
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
}
