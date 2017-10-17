//
//  SigninWireframe.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/16.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

struct SigninWireframe: WireFrame {
    typealias ViewController = SigninViewController
    
    fileprivate weak var viewController: SigninViewController?
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func showMain() {
        let nextViewController = MainViewControllerBuilder.build()
        self.viewController?.present(nextViewController, animated: true, completion: nil)
    }
}
