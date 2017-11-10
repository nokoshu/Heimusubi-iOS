//
//  ConnectHeimuRepository.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/17.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol ConnectHeimuRepository {
    func registerHeimu(heimuName: String, address: String)
}

class ConnectHeimuRepositoryImplementation: ConnectHeimuRepository {
    fileprivate let dataStore: ConnectHeimuDataStore!
    
    init(dataStore: ConnectHeimuDataStore) {
        self.dataStore = dataStore
    }
    
    func registerHeimu(heimuName: String, address: String) {
        print("ok")
    }
}
