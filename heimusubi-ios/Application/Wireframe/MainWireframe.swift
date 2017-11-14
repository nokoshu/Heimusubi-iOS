//
//  SigninWireframe.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/16.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

struct MainWireframe: WireFrame {
    typealias ViewController = MainViewController
    
    fileprivate weak var viewController: MainViewController!
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    
    func showRecordPopupView() {
        let nextViewController = RecordPopupViewControllerBuilder.build()
        nextViewController.modalPresentationStyle = .overCurrentContext
        nextViewController.modalTransitionStyle = .crossDissolve
        self.viewController.present(nextViewController, animated: true, completion: nil)
    }
}
