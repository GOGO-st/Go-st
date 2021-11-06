//
//  ReportStartViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import Then
import SnapKit

final class ReportStartViewController: UIViewController {

    static let identifier = "ReportStartViewController"
    
    private let reportStartView = ReportStartView()
//    let testLabel = UILabel().then {
//        $0.text = "ReportViewController"
//    }
//
//    let testButton = UIButton().then {
//        $0.backgroundColor = .blue
//        $0.setTitle("다음", for: .normal)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("여기는 ReportStartViewController")
        view.addSubview(reportStartView)
//        view.addSubview(testButton)
        reportStartView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
//        testButton.snp.makeConstraints {
//            $0.top.equalTo(testLabel.snp.bottom).offset(20)
//            $0.centerX.equalToSuperview()
//        }

        reportStartView.testButton.addTarget(self, action: #selector(testButtonDidTap), for: .touchUpInside)
    }
    
    @objc func testButtonDidTap() {
        self.navigationController?.pushViewController(ReportResultViewController(), animated: true)
    }
}
