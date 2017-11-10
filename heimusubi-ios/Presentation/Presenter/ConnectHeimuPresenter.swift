//
//  RegisterHeimuPresenter.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol ConnectHeimuPresenter {
    func registerButtonPressed(heimuName: String, address: String)
}

class ConnectHeimuPresenterImplementation: ConnectHeimuPresenter {
    fileprivate let useCase: ConnectHeimuUseCase!
    fileprivate let wireframe: ConnectHeimuWireframe!
    
    init(wireframe: ConnectHeimuWireframe, useCase: ConnectHeimuUseCase) {
        self.wireframe  = wireframe
        self.useCase    = useCase
    }
    
    
    func registerButtonPressed(heimuName: String, address: String) {
//        self.useCase.registerHeimu(heimuName: heimuName, address: address)
        self.wireframe.showMain()
    }
    
}
