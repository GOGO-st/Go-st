//
//  LoginFinishedViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit

final class LoginFinishedViewController: UIViewController {
    
    static let identifier = "LoginFinishedViewController"
    
    let titleView = NavigationTitleView()
    let loginFinishedView = LoginFinishedView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addContentView()
        self.setAutoLayout()
        self.setNavigationTitleView()
//        loginNumberView.finishedButton.addTarget(self, action: #selector(finishedButtonDidTap), for: .touchUpInside)
    }
    
    private func addContentView() {
        view.addSubview(titleView)
        view.addSubview(loginFinishedView)
    }
    
    private func setAutoLayout() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        titleView.snp.makeConstraints {
            $0.top.left.right.equalTo(safeArea)
        }
        loginFinishedView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()//(safeArea) // 일단 일케
        }
    }
    
    private func setNavigationTitleView() {
        titleView.setTitle("회원가입")
        titleView.setBackgroundColor(.black)
    }
    
    @objc private func finishedButtonDidTap() {
//        self.navigationController?.pushViewController(LoginFinishedViewController(), animated: false)
    }
}
