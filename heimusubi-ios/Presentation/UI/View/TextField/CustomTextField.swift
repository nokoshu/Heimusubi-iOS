//
//  CustomTextField.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/10.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    @IBInspectable var iconName: String = "" {
        didSet {
            let iconImage = UIImage(named: iconName)
            let leftImageView = UIImageView()
            let leftView = UIView()
            
            leftImageView.frame = CGRect(x: 10, y: 0, width: 20, height: 20)
            leftView.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
            
            leftImageView.contentMode = UIViewContentMode.scaleAspectFit
            leftImageView.image = iconImage
            leftView.addSubview(leftImageView)
            
            self.leftView = leftView
            self.leftViewMode = UITextFieldViewMode.always
        }
    }
    

}
