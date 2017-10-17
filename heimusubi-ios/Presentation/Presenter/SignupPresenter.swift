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
}

class SignupPresenterImplementation: SignupPresenter {
    
    func signupButtonPressed(userName: String, email: String, password: String) {
        
    }
    
}
