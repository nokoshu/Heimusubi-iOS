//
//  SignupViewController.swift
//  heimusubi-ios
//
//  Created by 竹之下遼 on 2017/10/17.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    fileprivate var presenter: SignupPresenter?
    fileprivate var activeTextField: CustomTextField?

    @IBOutlet weak var backgroundScrollView: UIScrollView!
    @IBOutlet weak var userNameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundScrollView.delegate = self
        userNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func inject(presenter: SignupPresenter) {
        self.presenter = presenter
    }
    
    
    /*-------------------------------------------------
     * Action of UI Elements
     *-----------------------------------------------*/
    @IBAction func signupButtonPressed(_ sender: Any) {
        if let userName = userNameTextField.text,
            let email = emailTextField.text,
            let plainTextPassword = passwordTextField.text {
            self.presenter?.signupButtonPressed(userName: userName, email: email, password: plainTextPassword)
        }
    }
    
    
    /*-------------------------------------------------
     * Delegate Method of UITextField and UIScrollView
     *-----------------------------------------------*/
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeTextField = textField as? CustomTextField
        backgroundScrollView.setContentOffset(CGPoint(x: 0.0, y: 150.0), animated: true)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        backgroundScrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        backgroundScrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
        view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
