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
        let dataStore           = SigninDataStoreImplementation()
        let repository          = SigninRepositoryImplementation(dataStore: dataStore)
        let useCase             = SigninUseCaseImplementation(repository: repository)
        let presenter           = SigninPresenterImplementation(useCase: useCase)
        
        dataStore.inject(repository: repository)
        repository.inject(useCase: useCase)
        viewController.inject(presenter: presenter)
        
        return viewController
    }
}


