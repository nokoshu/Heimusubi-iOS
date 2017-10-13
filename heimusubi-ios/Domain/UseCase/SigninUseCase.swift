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
}

final class SigninUseCaseImplementation: SigninUseCase {
    fileprivate var repository: SigninRepository!
    
    init(repository: SigninRepository) {
        self.repository = repository
    }
    
    func signin(email: String, plainTextPassword: String) {
        self.repository.signin(email: email, plainTextPassword: plainTextPassword)
    }
}
