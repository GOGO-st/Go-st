//
//  ReportNavigationViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/06.
//

import UIKit

class ReportNavigationViewController: UINavigationController {

    static let identifier = "ReportNavigationViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = R.color.background()
        self.isNavigationBarHidden = true
        self.pushViewController(ReportStartViewController(), animated: true)
    }
}
