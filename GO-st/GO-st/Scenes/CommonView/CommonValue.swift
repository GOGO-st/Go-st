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
    
    // 확인버튼
    var buttonOriginY: CGFloat = 0
    
    var tabBarHeight: CGFloat = 49
    
    lazy var bottomFrame: CGFloat = {
        self.WIDTH - self.tabBarHeight
    }()
    
    func getButtonFrame() -> CGRect {
        // 65는 왼쪽 32 오른쪽 33 합친거임
        let width = self.WIDTH - 65
        let height = width * 52 / 310
        buttonOriginY = self.HEIGHT - self.tabBarHeight - height - 91
        return CGRect(x: 32, y: buttonOriginY, width: width, height: height)
    }
    
    func setTabBarHeight(height: CGFloat) {
        self.tabBarHeight = height
    }
}
