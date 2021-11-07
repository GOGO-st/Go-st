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
    
    let emailView = LoginEmailView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(emailView)
        
        emailView.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(safeArea) // 일단 일케
        }
        
        emailView.finishedButton.addTarget(self, action: #selector(finishedButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func finishedButtonDidTap() {
        self.navigationController?.pushViewController(LoginNumberViewController(), animated: false)
    }
}
