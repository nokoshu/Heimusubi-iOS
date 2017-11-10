//
//  ConnectHeimuUseCase.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation
import CoreBluetooth

protocol ConnectHeimuUseCase {
    func registerHeimu(heimuName: String, address: String)
}

class ConnectHeimuUseCaseImplementation: ConnectHeimuUseCase {
    fileprivate let repository: ConnectHeimuRepository!
    
    init(repository: ConnectHeimuRepository) {
        self.repository = repository
    }
    
    func registerHeimu(heimuName: String, address: String) {
        self.repository.registerHeimu(heimuName: heimuName, address: address)
    }

}
