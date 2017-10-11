//
//  SigninViewControllerBuilder.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/08.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

struct SigninViewControllerBuilder: ViewControllerBuilder {
    typealias ViewController = SigninViewController
    
    static func build() -> ViewController {
        let viewController = SigninViewController()
        let presenter = SigninPresenterImplemention()
        
        viewController.inject(presenter: presenter)
        
        return viewController
    }
}


