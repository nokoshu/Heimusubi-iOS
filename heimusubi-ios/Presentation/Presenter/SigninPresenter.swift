//
//  SigninPresenter.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/10.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol SigninPresenter {
    func signinButtonPressed(email: String, plaintextPassword: String)
}

class SigninPresenterImplemention: SigninPresenter {
    func signinButtonPressed(email: String, plaintextPassword: String) {
    }
}

struct SigninParameters {
    var email: String
    var password: String
}
