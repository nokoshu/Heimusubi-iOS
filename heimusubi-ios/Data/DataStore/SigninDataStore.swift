//
//  SigninDataStore.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

import Alamofire

protocol SigninDataStore: class {
    func signin(email: String, plainTextPassword: String) -> Void
}

final class SigninDataStoreImplementation: SigninDataStore {
    fileprivate weak var repository: SigninRepository!
    
    func inject(repository: SigninRepository) {
        self.repository = repository
    }
    
    func signin(email: String, plainTextPassword: String) {
        HeimusubiAPIClient.signin(email: email, plainTextPassword: plainTextPassword)  { response in
            switch response {
            case .success(let value):
                print(value.email)
                self.repository.dataStore(didSigninUser: value)
                
            case .error(let error):
                print(error)
            }
        }
    }
}

