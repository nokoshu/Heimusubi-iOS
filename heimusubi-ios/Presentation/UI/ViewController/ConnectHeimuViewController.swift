//
//  ConnectHeimuViewController.swift
//  heimusubi-ios
//
//  Created by 竹之下遼 on 2017/10/26.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

class ConnectHeimuViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    fileprivate var presenter: ConnectHeimuPresenter!
    fileprivate var activeTextField: CustomTextField?

    @IBOutlet weak var backgroundScrollView: UIScrollView!
    @IBOutlet weak var heimuNameTextField: CustomTextField!
    @IBOutlet weak var addressTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.backgroundScrollView.delegate = self
        self.heimuNameTextField.delegate = self
        self.addressTextField.delegate   = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func inject(presenter: ConnectHeimuPresenter) {
        self.presenter = presenter
    }
    
    
    /*-------------------------------------------------
     * Action of UI Elements
     *-----------------------------------------------*/
    @IBAction func registerButtonPressed(_ sender: Any) {
        if let heimuName = self.heimuNameTextField.text, let address = self.addressTextField.text {
            self.presenter.registerButtonPressed(heimuName: heimuName, address: address)
        }
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
