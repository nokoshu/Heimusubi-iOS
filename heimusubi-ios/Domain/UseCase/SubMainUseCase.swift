//
//  SigninUseCase.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol SubMainUseCase: class {

}

final class SubMainUseCaseImplementation: SubMainUseCase {
    fileprivate var presenter: MainPresenter!
    
    func inject(presenter: MainPresenter) {
        self.presenter = presenter
    }

}
