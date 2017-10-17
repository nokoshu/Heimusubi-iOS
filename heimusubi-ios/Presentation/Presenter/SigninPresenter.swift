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
    func signupButtonPressed()
    func useCase(didSigninUser user: HeimusubiUserModel)
}

class SigninPresenterImplementation: SigninPresenter {
    fileprivate let useCase: SigninUseCase!
    fileprivate let wireframe: SigninWireframe!
    
    init(useCase: SigninUseCase, wireframe: SigninWireframe) {
        self.useCase    = useCase
        self.wireframe  = wireframe
    }
    
    func signinButtonPressed(email: String, plaintextPassword: String) {
        self.useCase.signin(email: email, plainTextPassword: plaintextPassword)
    }
    
    func signupButtonPressed() {
        self.wireframe.showSignup()
    }
    
    func useCase(didSigninUser user: HeimusubiUserModel) {
        self.wireframe.showMain()
    }

}
