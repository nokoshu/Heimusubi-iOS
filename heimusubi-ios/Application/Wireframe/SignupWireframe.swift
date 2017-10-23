//
//  SignupWireframe.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/18.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

struct SignupWireframe: WireFrame {
    typealias ViewController = SignupViewController
    
    fileprivate weak var viewController: SignupViewController?
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func backToSignin() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
}
