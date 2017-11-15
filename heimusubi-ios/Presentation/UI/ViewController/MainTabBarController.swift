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

        var viewControllers: [UIViewController] = []
        
        let firstViewController = MainViewControllerBuilder.build()
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostRecent, tag: 1)
        viewControllers.append(firstViewController)
 
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
