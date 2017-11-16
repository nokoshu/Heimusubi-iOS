//
//  MainTabBarController.swift
//  heimusubi-ios
//
//  Created by  on 2017/11/10.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting Background Color
        UITabBar.appearance().backgroundImage = UIImage(named: "background_tabbar")
        
        var viewControllers: [UIViewController] = []
        
        let firstViewController = MainPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        firstViewController.tabBarItem = UITabBarItem(title: "test", image: UIImage(named: "icon_setting"), tag: 1)
        viewControllers.append(firstViewController)
        
        let secondViewController = AddHeimuViewController()
        secondViewController.tabBarItem = UITabBarItem(title: "tet", image: UIImage(named: "icon_heimu_add"), tag: 2)
        viewControllers.append(secondViewController)

        let thirdViewController = MessageViewController()
        thirdViewController.tabBarItem = UITabBarItem(title: "tet", image: UIImage(named: "icon_message"), tag: 3)
        viewControllers.append(thirdViewController)

 
        self.setViewControllers(viewControllers, animated: false)
        
        
        // なぜか0だけだと選択されないので1にしてから0に
        self.selectedIndex = 1
        self.selectedIndex = 0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
