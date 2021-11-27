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
        
        firstTab.tabBarItem = UITabBarItem(title: nil, image: R.image.icon.icNonSearch(), selectedImage: R.image.icon.icSearch())
        secondTab.tabBarItem = UITabBarItem(title: nil, image: R.image.icon.icNonGost(), selectedImage: R.image.icon.icGost())
        thirdTab.tabBarItem = UITabBarItem(title: nil, image: R.image.icon.icNonProfile(), selectedImage: R.image.icon.icProfile())
        
        let tabs =  [firstTab, secondTab, thirdTab]
        
        self.setViewControllers(tabs, animated: false)
    }
}

