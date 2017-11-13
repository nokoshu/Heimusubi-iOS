//
//  SigninUseCase.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol MainUseCase: class {

}

final class MainUseCaseImplementation: MainUseCase {
    fileprivate let repository: MainRepository!
    fileprivate var presenter: MainPresenter!
    
    init(repository: MainRepository) {
        self.repository = repository
    }
    
    func inject(presenter: MainPresenter) {
        self.presenter = presenter
    }

}
