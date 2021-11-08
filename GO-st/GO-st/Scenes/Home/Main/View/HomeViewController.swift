//
//  HomeViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import NMapsMap
import Then
import SnapKit

final class HomeViewController: UIViewController {
    
    static let identifier = "HomeViewController"
//    let viewModel = HomeViewModel()
    let homeView = HomeView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.goButton.addTarget(self, action: #selector(goButtonDidTap), for: .touchUpInside)
        
        view.addSubview(homeView)
        homeView.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // 카테고리 뷰 버튼
    @objc func goButtonDidTap(_ sender: UIButton) {
        let categoryVC = CategoryViewController()
        categoryVC.modalPresentationStyle = .overFullScreen
        categoryVC.modalTransitionStyle = .crossDissolve
        present(categoryVC, animated: true, completion: nil)
    }

}
