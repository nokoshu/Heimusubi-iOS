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
    
    fileprivate let viewController: SignupViewController!
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func showRegisterHeimu() {
        let nextViewController = RegisterHeimuViewControllerBuilder.build()
        self.viewController.present(nextViewController, animated: true, completion: nil)
    }
    
    func backToSignin() {
        self.viewController.dismiss(animated: true, completion: nil)
    }
}
