//
//  MainViewControllerBuilder.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/16.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

struct SubMainViewControllerBuilder: ViewControllerBuilder {
    typealias ViewController = SubMainViewController
    
    static func build() -> ViewController {
        let viewController      = SubMainViewController()
        let wireframe           = SubMainWireframe(viewController: viewController)
        let useCase             = SubMainUseCaseImplementation()
        let presenter           = SubMainPresenterImplementation(useCase: useCase, wireframe: wireframe)
        
        viewController.inject(presenter: presenter)
        
        return viewController
    }
    
}
