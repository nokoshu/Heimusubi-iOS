//
//  MainViewControllerBuilder.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/16.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

struct MainViewControllerBuilder: ViewControllerBuilder {
    typealias ViewController = MainViewController
    
    static func build() -> ViewController {
        let viewController      = MainViewController()
        
        return viewController
    }
    
}
