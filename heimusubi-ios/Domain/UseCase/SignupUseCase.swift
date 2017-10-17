//
//  SignupUseCase.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/17.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol SignupUseCase {
    func signup(useName: String, email: String, password: String)
}

class SignupUseCaseImplementation: SignupUseCase {
    fileprivate let repository: SignupRepository!
    
    init(repository: SignupRepository) {
        self.repository = repository
    }
    
    func signup(useName: String, email: String, password: String) {
        self.repository.signup(userName: useName, email: email, password: password)
    }
}
