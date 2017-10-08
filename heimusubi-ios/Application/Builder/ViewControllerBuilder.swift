//
//  ViewControllerBuilder.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/08.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

protocol ViewControlellerBuilder {
    associatedtype ViewController: UIViewController
    
    static func build() -> ViewController
}

