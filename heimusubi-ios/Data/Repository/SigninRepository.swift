//
//  SigninRepository.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol SigninRepository: class {
    func signin(email: String, plainTextPassword: String) -> Void
    
    func dataStore(didSigninUser user: HeimusubiUserEntity)
}

final class SigninRepositoryImplementation: SigninRepository {
    fileprivate let dataStore: SigninDataStore!
    fileprivate var useCase: SigninUseCase!
    
    init(dataStore: SigninDataStore) {
        self.dataStore = dataStore
    }
    
    func inject(useCase: SigninUseCase) {
        self.useCase = useCase
    }
    
    func signin(email: String, plainTextPassword: String) {
        self.dataStore.signin(email: email, plainTextPassword: plainTextPassword)
    }
    
    func dataStore(didSigninUser user: HeimusubiUserEntity) {
        self.useCase.repository(didSigninUser: user)
    }
}
