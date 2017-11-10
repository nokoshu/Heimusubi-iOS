//
//  RegisterHeimuPresenter.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol BootHeimuPresenter {
    func nextButtonPressed()
}

class BootHeimuPresenterImplementation: BootHeimuPresenter {
    fileprivate let wireframe: BootHeimuWireframe!
    
    init(wireframe: BootHeimuWireframe) {
        self.wireframe = wireframe
    }
    
    
    func nextButtonPressed() {
        self.wireframe.showConnectHeimuView()
    }
    
}
