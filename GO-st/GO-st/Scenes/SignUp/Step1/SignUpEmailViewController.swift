//
//  SignUpEmailViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit
import Then
import SnapKit

class SignUpEmailViewController: UIViewController {

    static let identifier = "SignUpEmailViewController"
    
    let titleView = NavigationTitleView()
    let emailView = SignUpEmailView()
    let viewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addContentView()
        self.setAutoLayout()
        self.setNavigationTitleView()
        emailView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        emailView.emailTextField.addTarget(self, action: #selector(checkValidity), for: .editingChanged)
    }
    
    private func addContentView() {
        view.addSubview(titleView)
        view.addSubview(emailView)
    }
    
    private func setAutoLayout() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        titleView.snp.makeConstraints {
            $0.top.left.right.equalTo(safeArea)
        }
        emailView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()//(safeArea) // 일단 일케
        }
    }
    
    private func setNavigationTitleView() {
        titleView.setTitle("회원가입")
//        titleView.setBackgroundColor(.black)
    }
    
    @objc private func nextButtonDidTap() {
        
        let nextVC = SignUpOTPViewController()
        nextVC.email = self.emailView.getEmail()
        self.navigationController?.pushViewController(nextVC, animated: false)
        
//        UserService.shared.authenticateEmail(emailView.getEmail()) { [self] (networkResult) -> (Void) in
//            switch networkResult {
//            case .success(let data):
//                print(data)
////                if let code = data as? {
////
////                }
//            case .requestErr(_):
//                print("requestErr")
//            case .pathErr:
//                print("pathErr")
//            case .serverErr:
//                print("serverErr")
//            case .networkFail:
//                print("networkFail")
//            }
//
//        }
    }
    
    // 한글자라도 입력하면 버튼 활성화
    @objc
    private func checkValidity(_ textField: UITextField) {
        if viewModel.validateEmail(textField.text ?? "") {
            emailView.canIUseNextButton(true)
        } else {
            emailView.canIUseNextButton(false)
        }
    }
}
