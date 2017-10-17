//
//  Wireframe.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/16.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

protocol WireFrame {
    associatedtype ViewController: UIViewController
    
    init(viewController: ViewController)
}
