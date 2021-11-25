//
//  MyPageNavigationViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/20.
//

import UIKit

class MyPageNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = R.color.background()
        self.isNavigationBarHidden = true
        self.pushViewController(MyPageViewController(), animated: true)
    }
}
