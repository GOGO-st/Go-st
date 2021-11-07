//
//  LoginNavigationViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit

class LoginNavigationViewController: UINavigationController {

    static let identifier = "LoginNavigationViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isNavigationBarHidden = true
        self.pushViewController(LoginEmailViewController(), animated: false)
    }
}
