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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addContentView()
        self.setAutoLayout()
        self.setNavigationTitleView()
        signUpPasswordView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
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
        titleView.setBackgroundColor(.black)
    }
    
    @objc private func nextButtonDidTap() {
        self.navigationController?.pushViewController(SignUpFinishedViewController(), animated: false)
    }
}
