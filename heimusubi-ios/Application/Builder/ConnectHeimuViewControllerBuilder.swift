//
//  RegisterHeimuViewControllerBuilder.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

struct ConnectHeimuViewControllerBuilder: ViewControllerBuilder {
    typealias ViewController = ConnectHeimuViewController
    
    static func build() -> ViewController {
        let viewController      = ViewController()
        let dataStore           = ConnectHeimuDataStoreImplementation()
        let repository          = ConnectHeimuRepositoryImplementation(dataStore: dataStore)
        let useCase             = ConnectHeimuUseCaseImplementation(repository: repository)
        let wireframe           = ConnectHeimuWireframe(viewController: viewController)
        let presenter           = ConnectHeimuPresenterImplementation(wireframe: wireframe, useCase: useCase)
        
        viewController.inject(presenter: presenter)

        return viewController
    }
}
