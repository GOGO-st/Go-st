//
//  SignInViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/25.
//

import UIKit
import Then
import SnapKit

class SignInViewController: UIViewController {
    
    private let titleView = NavigationTitleView()
    private let signInView = SignInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView.setTitle("로그인")
        addContentView()
        setAutoLayout()
        
        titleView.leftButton.addTarget(self, action: #selector(leftButtonDidTap), for: .touchUpInside)
        signInView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    private func addContentView() {
        view.addSubview(titleView)
        view.addSubview(signInView)
    }
    
    private func setAutoLayout() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        titleView.snp.makeConstraints {
            $0.top.left.right.equalTo(safeArea)
        }
        signInView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()//(safeArea) // 일단 일케
        }
    }
    
    // 이전뷰로 돌아가기
    @objc
    private func leftButtonDidTap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 홈
    @objc
    private func nextButtonDidTap() {
        self.navigationController?.pushViewController(TabBarViewController(), animated: false)
    }
}
