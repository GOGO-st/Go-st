//
//  ReportResultViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/06.
//

import UIKit
import Then
import SnapKit

final class ReportResultViewController: UIViewController {

    static let identifier = "ReportResultViewController"
    let testLabel = UILabel().then {
        $0.text = "ReportResultViewController"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(testLabel)
        
        testLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}
