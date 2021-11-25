//
//  SignInNavigationViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/25.
//

import UIKit

class SignInNavigationViewController: UINavigationController {

    static let identifier = "SignInNavigationViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = R.color.background()
        self.isNavigationBarHidden = true
        self.pushViewController(SignInViewController(), animated: false)
    }
}
