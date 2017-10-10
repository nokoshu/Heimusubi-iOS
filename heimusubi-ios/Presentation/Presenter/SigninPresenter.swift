//
//  SigninPresenter.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/10.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol SigninPresenter {
    func signinButtonPressed(parameters: LoginParameters)
}

class SigninPresenterImplemention: SigninPresenter {
    func signinButtonPressed(parameters: LoginParameters) {
        print("test")
    }
}

struct LoginParameters {
    var email: String
    var password: String
}
