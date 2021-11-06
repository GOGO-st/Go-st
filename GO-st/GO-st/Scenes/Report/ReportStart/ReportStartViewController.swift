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
    private let titleView = NavigationTitleView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addContentView()
        setAutoLayout()
        
        reportStartView.testButton.addTarget(self, action: #selector(testButtonDidTap), for: .touchUpInside)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func addContentView() {
        view.addSubview(titleView)
        view.addSubview(reportStartView)
        
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        // 네비게이션 타이틀
        titleView.snp.makeConstraints {
            $0.top.left.right.equalTo(safeArea)
        }
        // 전체 뷰
        reportStartView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.left.right.bottom.equalTo(safeArea)
        }
    }
    
    
    
    @objc func testButtonDidTap() {
        self.navigationController?.pushViewController(ReportResultViewController(), animated: true)
    }
}
