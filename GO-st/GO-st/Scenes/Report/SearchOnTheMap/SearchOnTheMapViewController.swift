//
//  SearchOnTheMapViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/06.
//

import UIKit
import Then
import SnapKit

final class SearchOnTheMapViewController: UIViewController {

    static let identifier = "ReportStartViewController"
    
    private let titleView = NavigationTitleView().then {
        $0.leftButton.isHidden = false
    }
    private let searchMapView = SearchOnTheMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.addContentView()
        self.setAutoLayout()
        
        titleView.leftButton.addTarget(self, action: #selector(leftButtonDidTap), for: .touchUpInside)
    }
    
    private func addContentView() {
        view.addSubview(titleView)
        view.addSubview(searchMapView)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        // 네비게이션 타이틀
        titleView.snp.makeConstraints {
            $0.top.left.right.equalTo(safeArea)
        }
        // 전체 뷰
        searchMapView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.left.right.bottom.equalTo(safeArea)
        }
    }
    
    // 이전뷰로 돌아가기
    @objc private func leftButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
}
