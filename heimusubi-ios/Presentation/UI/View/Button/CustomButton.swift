//
//  CustomButton.swift
//  heimusubi-ios
//
//  Created by RyoBamboo     on 2017/10/10.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    // 文字色
    @IBInspectable var color: UIColor?
    
    // 背景色
    @IBInspectable var defaultBackgroundColor: UIColor?
    
    // 選択された時の背景色
    @IBInspectable var highlightedBackgroundColor: UIColor?
    override var isHighlighted: Bool {
        didSet {
            if (isHighlighted) {
                backgroundColor = highlightedBackgroundColor
            } else {
                backgroundColor = defaultBackgroundColor
            }
        }
    }

    // 角丸
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    // 枠線の太さ
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1) {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

}
