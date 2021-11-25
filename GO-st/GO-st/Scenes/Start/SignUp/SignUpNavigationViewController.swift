//
//  SignUpNavigationViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit

class SignUpNavigationViewController: UINavigationController {

    static let identifier = "SignUpNavigationViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = R.color.background()
        self.isNavigationBarHidden = true
        self.pushViewController(SignUpEmailViewController(), animated: false)
    }
}
