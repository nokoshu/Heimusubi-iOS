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
        let viewController      = SigninViewController()
        let wireframe           = SigninWireframe(viewController: viewController)
        let dataStore           = SigninDataStoreImplementation()
        let repository          = SigninRepositoryImplementation(dataStore: dataStore)
        let useCase             = SigninUseCaseImplementation(repository: repository)
        let presenter           = SigninPresenterImplementation(useCase: useCase, wireframe: wireframe)
        
        
        dataStore.inject(repository: repository)
        repository.inject(useCase: useCase)
        useCase.inject(presenter: presenter)
        viewController.inject(presenter: presenter)
        
        return viewController
    }
}


