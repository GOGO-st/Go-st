//
//  StoreInfoDetailViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/19.
//

import UIKit
import Then
import SnapKit
import MapKit

class StoreInfoDetailViewController: UIViewController {
    
    let detailView = StoreInfoDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("안뇽 여긴 디테일뷰")
        view.backgroundColor = R.color.background()
        view.addSubview(detailView)
        
        detailView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
    }
}
