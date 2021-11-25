//
//  StartViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/25.
//

import UIKit

class StartViewController: UIViewController {
    
    let startView = StartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(startView)
    }
}
