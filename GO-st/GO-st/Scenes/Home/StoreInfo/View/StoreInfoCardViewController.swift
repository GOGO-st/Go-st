//
//  StoreInfoCardViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/06.
//

import UIKit
import Then
import SnapKit
import MapKit

class StoreInfoCardViewController: UIViewController {
    
    let storeInfoView = StoreInfoCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(storeInfoView)
        storeInfoView.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func bind(_ data: MKAnnotation) {
        storeInfoView.setData(data)
    }
    
    func activate() {
        storeInfoView.isHidden = false
    }
    
    func deactivate() {
        storeInfoView.isHidden = true
    }
}
