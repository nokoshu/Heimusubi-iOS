//
//  SigninViewControllerBuilder.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/08.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

struct SignupViewControllerBuilder: ViewControllerBuilder {
    typealias ViewController = SignupViewController
    
    static func build() -> ViewController {
        let viewController      = SignupViewController()
        let repository          = SignupRepositoryImplementation()
        let useCase             = SignupUseCaseImplementation(repository: repository)
        let presenter           = SignupPresenterImplementation(useCase: useCase)
        
        viewController.inject(presenter: presenter)
        
        return viewController
    }
}


