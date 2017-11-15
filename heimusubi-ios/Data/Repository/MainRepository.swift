//
//  SigninRepository.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol MainRepository: class {
    
}

final class MainRepositoryImplementation: MainRepository {
    fileprivate let dataStore: MainDataStore!
    fileprivate var useCase: MainUseCase!
    
    init(dataStore: MainDataStore) {
        self.dataStore = dataStore
    }
    
    func inject(useCase: MainUseCase) {
        self.useCase = useCase
    }

}
