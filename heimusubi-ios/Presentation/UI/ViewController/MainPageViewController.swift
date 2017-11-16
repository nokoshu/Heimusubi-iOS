//
//  MainPageViewController.swift
//  heimusubi-ios
//
//  Created by 竹之下遼 on 2017/11/15.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewControllers([getFirst()], direction: .reverse, animated: true, completion: nil)
        self.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getFirst() -> MainViewController {
        return MainViewControllerBuilder.build()
    }
    
    func getSecond() -> SubMainViewController {
        return SubMainViewControllerBuilder.build()
    }

}


extension MainPageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print("Before")
        if viewController.isKind(of: SubMainViewController.self) {
            // 2 -> 1
            return getFirst()
        } else {
            // 1 -> end of the road
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        print("After")
        if viewController.isKind(of: MainViewController.self) {
            // 1 -> 2
            return getSecond()
        }else{
            // 2 -> end of the road
            return nil
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 2
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
