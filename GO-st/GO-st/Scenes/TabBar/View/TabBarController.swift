//
//  TabBarController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        self.tabBar.tintColor = UIColor.black
        
        // Home
        let home = UIStoryboard.init(name: "Home", bundle: nil)
        guard let firstTab = home.instantiateViewController(identifier: HomeViewController.identifier) as? HomeViewController else {
            return
        }
        // Report
        let report = UIStoryboard.init(name: "Report", bundle:nil)
        guard let secondTab = report.instantiateViewController(identifier: ReportViewController.identifier) as? ReportViewController else {
            return
        }
        // MyPage
        let myPage = UIStoryboard.init(name: "MyPage", bundle: nil)
        guard let thirdTab = myPage.instantiateViewController(identifier: MyPageViewController.identifier) as? MyPageViewController else {
            return
        }
        
        
        firstTab.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        secondTab.tabBarItem = UITabBarItem(title: "제보", image: UIImage(systemName: "safari"), selectedImage: UIImage(systemName: "safari.fill"))
        thirdTab.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "sparkles.rectangle.stack"), selectedImage: UIImage(systemName: "sparkles.rectangle.stack.fill"))
        
        let tabs =  [firstTab, secondTab, thirdTab]
        
        self.setViewControllers(tabs, animated: false)
    }
}
