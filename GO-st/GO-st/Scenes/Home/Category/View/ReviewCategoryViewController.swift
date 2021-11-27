//
//  ReviewCategoryViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/28.
//

import UIKit
import Then
import SnapKit

final class ReviewCategoryViewController: UIViewController {
    
    let categoryView = ReviewCategoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(categoryView)
        
        categoryView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.categoryView.finishedButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func backButtonDidTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
