//
//  ReportNavigationViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/06.
//

import UIKit
import Then
import SnapKit

class ReportNavigationViewController: UINavigationController {

    static let identifier = "ReportNavigationViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pushViewController(ReportViewController(), animated: true)
    }
}
