//
//  RegisterHeimuViewControllerBuilder.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

struct ConnectHeimuViewControllerBuilder: ViewControllerBuilder {
    typealias ViewController = ConnectHeimuViewController
    
    static func build() -> ViewController {
        let viewController      = ViewController()
        

        return viewController
    }
}
