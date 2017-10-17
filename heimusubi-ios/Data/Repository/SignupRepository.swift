//
//  SignupRepository.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/17.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol SignupRepository {
    func signup(userName: String, email: String, password: String)
}

class SignupRepositoryImplementation: SignupRepository {
    
    func signup(userName: String, email: String, password: String) {
        
    }
}
