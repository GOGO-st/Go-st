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
        titleView.leftButton.addTarget(self, action: #selector(leftButtonDidTap), for: .touchUpInside)
        emailView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        emailView.emailTextField.addTarget(self, action: #selector(checkValidity), for: .editingChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
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
        
        // 서버 연결
        // 이메일 보내기
    }
    
    // 이전뷰로 돌아가기
    @objc
    private func leftButtonDidTap() {
        self.dismiss(animated: true, completion: nil)
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
    
    // keyboard 올라오면 nextbutton y 위치 바꾸기
    @objc
    func keyboardWillShow(_ sender: Notification) {
        // 키보드 높이 구하기
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            // 버튼 올리기 키보드에서 20 띄우기
            self.emailView.nextButton.buttonUp(keyboardFrame.cgRectValue.height)// - self.emailView.nextButton.frame.height + 20)
        }
    }
    
    // keyboard 사라지면 nextbutton y 위치 바꾸기
    @objc func keyboardWillHide(_ sender: Notification) {
        self.emailView.nextButton.buttonDown()
    }
}
