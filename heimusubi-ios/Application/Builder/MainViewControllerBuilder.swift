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
        let wireframe           = MainWireframe(viewController: viewController)
        let dataStore           = MainDataStoreImplementation()
        let repository          = MainRepositoryImplementation(dataStore: dataStore)
        let useCase             = MainUseCaseImplementation(repository: repository)
        let presenter           = MainPresenterImplementation(useCase: useCase, wireframe: wireframe)
        
        viewController.inject(presenter: presenter)
        
        return viewController
    }
    
}
