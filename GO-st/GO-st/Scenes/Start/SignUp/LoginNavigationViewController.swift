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
        self.view.backgroundColor = R.color.background()
        self.isNavigationBarHidden = true
        self.pushViewController(SignUpEmailViewController(), animated: false)
    }
}
