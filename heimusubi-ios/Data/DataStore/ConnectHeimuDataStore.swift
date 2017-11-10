//
//  ConnectHeimuDataStore.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/17.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol ConnectHeimuDataStore {
    func registerHeimu(heimuName: String, address: String)
}

class ConnectHeimuDataStoreImplementation: ConnectHeimuDataStore {
    func registerHeimu(heimuName: String, address: String) {
        HeimusubiAPIClient.registerHeimu(heimuName: heimuName, address: address) { response in
            switch response {
            case .success(let value):
                print("registered!!!")
            case .error(let error):
                print(error)
            }
        }
    }
}
