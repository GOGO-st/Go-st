//
//  LoginEmailViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit
import Then
import SnapKit

class LoginEmailViewController: UIViewController {

    static let identifier = "LoginEmailViewController"
    
    let titleView = NavigationTitleView()
    let emailView = LoginEmailView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addContentView()
        self.setAutoLayout()
        self.setNavigationTitleView()
        emailView.finishedButton.addTarget(self, action: #selector(finishedButtonDidTap), for: .touchUpInside)
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
        titleView.setBackgroundColor(.black)
    }
    
    @objc private func finishedButtonDidTap() {
        self.navigationController?.pushViewController(LoginNumberViewController(), animated: false)
    }
}
