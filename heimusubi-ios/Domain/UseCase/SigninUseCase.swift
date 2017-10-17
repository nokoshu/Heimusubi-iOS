//
//  SigninUseCase.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol SigninUseCase: class {
    func signin(email: String, plainTextPassword: String) -> Void
    
    func repository(didSigninUser user: HeimusubiUserEntity)
}

final class SigninUseCaseImplementation: SigninUseCase {
    fileprivate let repository: SigninRepository!
    fileprivate var presenter: SigninPresenter!
    
    init(repository: SigninRepository) {
        self.repository = repository
    }
    
    func inject(presenter: SigninPresenter) {
        self.presenter = presenter
    }
    
    func signin(email: String, plainTextPassword: String) {
        self.repository.signin(email: email, plainTextPassword: plainTextPassword)
    }
    
    func repository(didSigninUser user: HeimusubiUserEntity) {
        UserDefaults.standard.set(true, forKey: "isSignin")
        let userModel = HeimusubiUserTranslator.translate(entry: user)
        self.presenter.useCase(didSigninUser: userModel)
    }
}
