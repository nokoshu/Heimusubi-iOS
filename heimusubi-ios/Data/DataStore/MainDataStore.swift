//
//  SigninDataStore.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

import Alamofire

protocol MainDataStore: class {
    func getWeatherStatus(addressId: Int)
}

final class MainDataStoreImplementation: MainDataStore {

    func getWeatherStatus(addressId: Int) {
        HeimusubiAPIClient.getWeatherStatus(addressId: addressId)  { response in
            switch response {
            case .success(let value):
                    print(value)
            case .error(let error):
                print(error)
            }
        }
    }
}

