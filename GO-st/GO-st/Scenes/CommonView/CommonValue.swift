//
//  CommonValue.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/16.
//

import UIKit

class CommonValue {
    
    static let shared = CommonValue()
    
    let WIDTH: CGFloat = UIScreen.main.bounds.width
    let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    var tabBarHeight: CGFloat = 0
}
