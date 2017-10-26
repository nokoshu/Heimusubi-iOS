//
//  RegisterHeimuWireframe.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/26.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

struct RegisterHeimuWireframe: WireFrame {
    typealias ViewController = RegisterHeimuViewController
    
    fileprivate let viewController: ViewController!
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func showBootHeimuView() {
        let nextViewController = BootHeimuViewControllerBuilder.build()
        self.viewController.present(nextViewController, animated: true, completion: nil)
    }
}
