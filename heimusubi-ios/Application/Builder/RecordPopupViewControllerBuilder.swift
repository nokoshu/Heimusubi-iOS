//
//  RegisterHeimuViewControllerBuilder.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

struct DetectHeimuViewControllerBuilder: ViewControllerBuilder {
    typealias ViewController = DetectHeimuViewController
    
    static func build() -> ViewController {
        let viewController      = ViewController()
        let useCase             = DetectHeimuUseCaseImplementation()
        let wireframe           = DetectHeimuWireframe(viewController: viewController)
        let presenter           = DetectHeimuPresenterImplementation(wireframe: wireframe, useCase: useCase)
        
        presenter.inject(viewController: viewController)
        viewController.inject(presenter: presenter)

        return viewController
    }
}
