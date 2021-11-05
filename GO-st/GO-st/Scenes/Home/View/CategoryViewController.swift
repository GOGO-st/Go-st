//
//  CategoryViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import SnapKit

class CategoryViewController: UIViewController {
    
    let categoryView = CategoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(categoryView)
        
        categoryView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
        
        self.categoryView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func backButtonDidTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
