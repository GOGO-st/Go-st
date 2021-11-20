//
//  HomeNavigationViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/19.
//

import UIKit

class HomeNavigationViewController: UINavigationController {
    
    static let identifier = "HomeNavigationViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = R.color.background()
        self.isNavigationBarHidden = true
        self.pushViewController(HomeViewController(), animated: true)
    }
}
