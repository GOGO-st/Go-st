//
//  ReportViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import Then
import SnapKit

final class ReportViewController: UIViewController {

    static let identifier = "ReportViewController"
    
    let testLabel = UILabel().then {
        $0.text = "ReportViewController"
    }
    
    let testButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("다음", for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("여기는 ReportViewController")
        view.addSubview(testLabel)
        view.addSubview(testButton)
        testLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        testButton.snp.makeConstraints {
            $0.top.equalTo(testLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }

        testButton.addTarget(self, action: #selector(testButtonDidTap), for: .touchUpInside)
    }
    
    @objc func testButtonDidTap() {
        self.navigationController?.pushViewController(ReportViewController(), animated: true)
    }
}
