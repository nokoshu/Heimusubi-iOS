//
//  Translator.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/15.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import Foundation

protocol Translator: class {
    associatedtype Input
    associatedtype Output
    
    static func translate(entry: Input) -> Output
}
