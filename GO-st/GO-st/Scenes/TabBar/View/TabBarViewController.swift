//
//  TabBarViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        self.tabBar.backgroundColor = .black
        self.tabBar.tintColor = .white
        
        CommonValue.shared.tabBarHeight = self.tabBar.frame.height
        
        // Home
        let firstTab = HomeNavigationViewController()
        
        // Report
        let secondTab = ReportNavigationViewController()
        // MyPage
        let thirdTab = MyPageNavigationViewController()
        
        
        firstTab.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        secondTab.tabBarItem = UITabBarItem(title: "제보", image: UIImage(systemName: "safari"), selectedImage: UIImage(systemName: "safari.fill"))
        thirdTab.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "sparkles.rectangle.stack"), selectedImage: UIImage(systemName: "sparkles.rectangle.stack.fill"))
        
        let tabs =  [firstTab, secondTab, thirdTab]
        
        self.setViewControllers(tabs, animated: false)
    }
}

