//
//  RegisterHeimuViewControllerBuilder.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

struct RecordPopupViewControllerBuilder: ViewControllerBuilder {
    typealias ViewController = RecordPopupViewController
    
    static func build() -> ViewController {
        let viewController      = ViewController()
        let useCase             = RecordPopupUseCaseImplementation()
        let wireframe           = RecordPopupWireframe(viewController: viewController)
        let presenter           = RecordPopupPresenterImplementation(wireframe: wireframe, useCase: useCase)
        
//        presenter.inject(viewController: viewController)
        viewController.inject(presenter: presenter)

        return viewController
    }
}
