//
//  MyPageViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import Then
import SnapKit

class MyPageViewController: UIViewController {

    static let identifier = "MyPageViewController"
    
    private let myPage = MyPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(myPage)
        
        myPage.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
    }
}
