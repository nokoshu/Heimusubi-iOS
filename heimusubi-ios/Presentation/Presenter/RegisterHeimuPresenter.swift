//
//  RegisterHeimuPresenter.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol RegisterHeimuPresenter {
    func searchHeimuButtonPressed()
}

class RegisterHeimuPresenterImplementation: RegisterHeimuPresenter {
    fileprivate var useCase: RegisterHeimuUseCase
    
    init(useCase: RegisterHeimuUseCase) {
        self.useCase = useCase
    }
    
    func searchHeimuButtonPressed() {
        print("pressed!")
    }
    
}
