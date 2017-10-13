//
//  SigninPresenter.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/10.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol SigninPresenter {
    func signinButtonPressed(email: String, plaintextPassword: String)
}

class SigninPresenterImplementation: SigninPresenter {
    fileprivate let useCase: SigninUseCase!
    
    init(useCase: SigninUseCase) {
        self.useCase = useCase
    }
    
    func signinButtonPressed(email: String, plaintextPassword: String) {
        self.useCase.signin(email: email, plainTextPassword: plaintextPassword)
    }
}
