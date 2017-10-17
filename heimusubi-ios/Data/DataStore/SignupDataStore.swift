//
//  SignupDataStore.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/17.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol SignupDataStore {
    func signin(userName: String, email: String, password: String)
}

class SignupDataStoreImplementation: SignupDataStore {
    func signin(userName: String, email: String, password: String) {
        
    }
}
