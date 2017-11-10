//
//  RegisterHeimuViewControllerBuilder.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

struct BootHeimuViewControllerBuilder: ViewControllerBuilder {
    typealias ViewController = BootHeimuViewController
    
    static func build() -> ViewController {
        let viewController      = ViewController()
        let wireframe           = BootHeimuWireframe(viewController: viewController)
        let presenter           = BootHeimuPresenterImplementation(wireframe: wireframe)
        
        viewController.inject(presenter: presenter)

        return viewController
    }
}
