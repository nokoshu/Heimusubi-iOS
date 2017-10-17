//
//  SignupPresenter.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/17.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol SignupPresenter {
    func signupButtonPressed(userName: String, email: String, password: String)
}

class SignupPresenterImplementation: SignupPresenter {
    fileprivate let useCase: SignupUseCase!
    
    init(useCase: SignupUseCase) {
        self.useCase = useCase
    }
    
    func signupButtonPressed(userName: String, email: String, password: String) {
        self.useCase.signup(useName: userName, email: email, password: password)
    }
    
}
