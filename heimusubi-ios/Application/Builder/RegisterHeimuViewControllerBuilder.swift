//
//  RegisterHeimuViewControllerBuilder.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

struct RegisterHeimuViewControllerBuilder: ViewControllerBuilder {
    typealias ViewController = RegisterHeimuViewController
    
    static func build() -> ViewController {
        let viewController      = ViewController()
        let useCase             = RegisterHeimuUseCaseImplementation()
        let wireframe           = RegisterHeimuWireframe(viewController: viewController)
        let presenter           = RegisterHeimuPresenterImplementation(wireframe: wireframe, useCase: useCase)
        
        viewController.inject(presenter: presenter)
        
        return viewController
    }
}
