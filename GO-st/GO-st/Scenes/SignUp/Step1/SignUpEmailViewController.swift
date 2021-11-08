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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addContentView()
        self.setAutoLayout()
        self.setNavigationTitleView()
        emailView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
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
    }
}
