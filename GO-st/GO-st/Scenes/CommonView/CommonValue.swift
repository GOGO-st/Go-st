//
//  CommonValue.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/16.
//

import UIKit
import CoreLocation

public enum CustomButtonType {
    case login
    case signUp
    case report
}
class CommonValue {
    
    static let shared = CommonValue()
    
    let WIDTH: CGFloat = UIScreen.main.bounds.width
    let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    let naviTitleHeight: CGFloat = 51
    
    var schoolCenter = CLLocation(latitude: 37.6068417784903, longitude: 127.04239392651976)
    
    // 확인버튼
    var buttonOriginY: CGFloat = 0
    
    var tabBarHeight: CGFloat = 49
    
    lazy var bottomFrame: CGFloat = {
        self.WIDTH - self.tabBarHeight
    }()
    
    // 확인버튼 프레임 -> 오토 맞추면서 바꾸기
    func getButtonFrame(_ type: CustomButtonType) -> CGRect {
        // 40은 양 옆
        let width = self.WIDTH - 40
        let height = width * 52 / 335
        
        print(HEIGHT, width, height)
        switch type {
            case .login: // navi 없는 거
                buttonOriginY = self.HEIGHT - height - 85 // - self.tabBarHeight
            case .signUp: // navi 있는 거
                buttonOriginY = self.HEIGHT - self.tabBarHeight - height - 85 - naviTitleHeight
            case .report:
                buttonOriginY = self.HEIGHT - self.tabBarHeight - 200
        }
        return CGRect(x: 20, y: buttonOriginY, width: width, height: height)
    }
    
    func setTabBarHeight(height: CGFloat) {
        self.tabBarHeight = height
    }
    
    // 서버 연결하면
    func setSchoolLocation(_ location: CLLocation) {
        self.schoolCenter = location
    }
}
