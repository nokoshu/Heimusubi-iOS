//
//  SignupDataStore.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/17.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol SignupDataStore {
    func signup(userName: String, email: String, plainTextPassword: String)
}

class SignupDataStoreImplementation: SignupDataStore {
    func signup(userName: String, email: String, plainTextPassword: String) {
        HeimusubiAPIClient.signup(userName: userName, email: email, plainTextPassword: plainTextPassword) { response in
            switch response {
            case .success(let value):
                print("registered!!!!")
            case .error(let error):
                print(error)
            }
        }
    }
}
