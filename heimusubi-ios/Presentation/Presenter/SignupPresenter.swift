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
    func backToSigninButtonPressed()
}

class SignupPresenterImplementation: SignupPresenter {
    fileprivate let useCase: SignupUseCase!
    fileprivate let wireframe: SignupWireframe!
    
    init(useCase: SignupUseCase, wireframe: SignupWireframe) {
        self.useCase = useCase
        self.wireframe = wireframe
    }
    
    func signupButtonPressed(userName: String, email: String, password: String) {
        self.useCase.signup(useName: userName, email: email, password: password)
    }
    
    func backToSigninButtonPressed() {
        self.wireframe.backToSignin()
    }
    
}
