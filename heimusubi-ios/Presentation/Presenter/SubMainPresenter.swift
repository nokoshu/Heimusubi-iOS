//
//  SigninPresenter.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/10.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol SubMainPresenter {
    func heimuSignImageViewPressed()
}

class SubMainPresenterImplementation: SubMainPresenter {
    fileprivate let useCase: SubMainUseCase!
    fileprivate let wireframe: SubMainWireframe!
    
    init(useCase: SubMainUseCase, wireframe: SubMainWireframe) {
        self.useCase    = useCase
        self.wireframe  = wireframe
    }
    
    func heimuSignImageViewPressed() {
        self.wireframe.showRecordPopupView()
    }


}
