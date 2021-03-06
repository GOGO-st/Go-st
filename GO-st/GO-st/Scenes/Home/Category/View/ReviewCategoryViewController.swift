//
//  ReviewCategoryViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/28.
//

import UIKit
import Then
import SnapKit

protocol SendCategoryList {
    func sendCategoryList(_ category: [Int])
}
final class ReviewCategoryViewController: UIViewController {
    
    let reviewCategoryView = ReviewCategoryView().then {
        $0.clipsToBounds = true
    }
//    var visualEffectView = UIVisualEffectView().then {
//        $0.effect = UIBlurEffect(style: .regular)
//    }
    var animationProgressWhenInterrupted:CGFloat = 0
    
    var delegate: SendCategoryList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        visualEffectView.frame = self.view.frame
//        view.addSubview(visualEffectView)
        view.addSubview(reviewCategoryView)
        
        reviewCategoryView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.left.right.bottom.equalToSuperview()
        }
        self.view.backgroundColor = .clear
        self.reviewCategoryView.finishedButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.backgroundColor = .clear
        
        delegate?.sendCategoryList(reviewCategoryView.selectedCategory)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesBegan(touches, with: event)
        if let touch = touches.first, touch.view == self.view { // 터치를 했고 그 터치의 뷰가 이 뷰컨트롤러의 뷰라면
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc private func backButtonDidTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
