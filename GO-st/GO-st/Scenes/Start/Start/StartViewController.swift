//
//  StartViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/25.
//

import UIKit

class StartViewController: UIViewController {
    
    let startView = StartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(startView)
        
        startView.loginButton.addTarget(self, action: #selector(signInButtonDidTap), for: .touchUpInside)
        startView.signUpButton.addTarget(self, action: #selector(signUpButtonDidTap), for: .touchUpInside)
    }
    
    
    @objc
    func signInButtonDidTap() {
        let nextVC = SignInNavigationViewController()
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: false, completion: nil)
    }
    
    @objc
    func signUpButtonDidTap() {
        let nextVC = SignUpNavigationViewController()
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: false, completion: nil)
    }
}
