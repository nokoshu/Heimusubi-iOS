//
//  SigninViewController.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/10.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    fileprivate var presenter: SigninPresenter!
    
    fileprivate var activeTextField: CustomTextField?

    @IBOutlet weak var backgroundScrollView: UIScrollView!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func inject(presenter: SigninPresenter) {
        self.presenter = presenter
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /*-------------------------------------------------
     * Action of UI Elements
     *-----------------------------------------------*/
    @IBAction func signinButtonPressed(_ sender: Any) {
        
    }
    
    
    /*-------------------------------------------------
     * Delegate Method of UITextField and UIScrollView
     *-----------------------------------------------*/
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeTextField = textField as? CustomTextField
        backgroundScrollView.setContentOffset(CGPoint(x: 0.0, y: 160.0), animated: true)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        backgroundScrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
        return true
    }
    
    
    
}
