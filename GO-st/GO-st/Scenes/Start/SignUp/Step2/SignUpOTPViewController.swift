//
//  SignUpOTPViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit

final class SignUpOTPViewController: UIViewController {
    
    static let identifier = "SignUpOTPViewController"
    
    let titleView = NavigationTitleView()
    let signUpOTPView = SignUpOTPView()
    
    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addContentView()
        self.setAutoLayout()
        self.setNavigationTitleView()
        
        titleView.leftButton.addTarget(self, action: #selector(leftButtonDidTap), for: .touchUpInside)
        
        signUpOTPView.setEmailLabel(email)
        signUpOTPView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func addContentView() {
        view.addSubview(titleView)
        view.addSubview(signUpOTPView)
    }
    
    private func setAutoLayout() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        titleView.snp.makeConstraints {
            $0.top.left.right.equalTo(safeArea)
        }
        signUpOTPView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()//(safeArea) // 일단 일케
        }
    }
    
    private func setNavigationTitleView() {
        titleView.setTitle("회원가입")
//        titleView.setBackgroundColor(.black)
    }
    
    // 이전뷰로 돌아가기
    @objc
    private func leftButtonDidTap() {
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc
    private func nextButtonDidTap() {
        let nextVC = SignUpPasswordViewController()
        nextVC.email = self.email
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
//    // keyboard 올라오면 nextbutton y 위치 바꾸기
//    @objc
//    func keyboardWillShow(_ sender: Notification) {
//        // 키보드 높이 구하기
//        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//            // 버튼 올리기 키보드에서 20 띄우기
//            self.signUpOTPView.nextButton.buttonUp(keyboardFrame.cgRectValue.height - self.signUpOTPView.nextButton.frame.height + 20)
//        }
//    }
//
//    // keyboard 사라지면 nextbutton y 위치 바꾸기
//    @objc func keyboardWillHide(_ sender: Notification) {
//        self.signUpOTPView.nextButton.buttonDown()
//    }
}
