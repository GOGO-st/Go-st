//
//  SignUpPasswordViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit

final class SignUpPasswordViewController: UIViewController {
    
    static let identifier = "SignUpPasswordViewController"
    
    let titleView = NavigationTitleView()
    let signUpPasswordView = SignUpPasswordView()
    
    var email = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addContentView()
        self.setAutoLayout()
        self.setNavigationTitleView()
        
        signUpPasswordView.setEmailLabel(email)
        signUpPasswordView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    private func addContentView() {
        view.addSubview(titleView)
        view.addSubview(signUpPasswordView)
    }
    
    private func setAutoLayout() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        titleView.snp.makeConstraints {
            $0.top.left.right.equalTo(safeArea)
        }
        signUpPasswordView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()//(safeArea) // 일단 일케
        }
    }
    
    private func setNavigationTitleView() {
        titleView.setTitle("회원가입")
//        titleView.setBackgroundColor(.black)
    }
    
    @objc
    private func nextButtonDidTap() {
        self.navigationController?.pushViewController(SignUpFinishedViewController(), animated: false)
    }
    
    // keyboard 올라오면 nextbutton y 위치 바꾸기
    @objc
    func keyboardWillShow(_ sender: Notification) {
        // 키보드 높이 구하기
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            // 버튼 올리기 키보드에서 20 띄우기
            self.signUpPasswordView.nextButton.buttonUp(keyboardFrame.cgRectValue.height - self.signUpPasswordView.nextButton.frame.height + 20)
        }
    }
    
    // keyboard 사라지면 nextbutton y 위치 바꾸기
    @objc func keyboardWillHide(_ sender: Notification) {
        self.signUpPasswordView.nextButton.buttonDown()
    }
}
