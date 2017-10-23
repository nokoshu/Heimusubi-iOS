//
//  RegisterHeimuUseCase.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol RegisterHeimuUseCase {
    func seachNearByHeimu()
}

class RegisterHeimuUseCaseImplementation: RegisterHeimuUseCase {
    func seachNearByHeimu() {
            print("search")
    }
}
