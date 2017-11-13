//
//  RegisterHeimuWireframe.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/26.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

struct ConnectHeimuWireframe: WireFrame {
    typealias ViewController = ConnectHeimuViewController
    
    fileprivate let viewController: ViewController!
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func showMain() {
        let nextViewController = MainTabBarController()
        self.viewController.present(nextViewController, animated: true, completion: nil)
    }
}
