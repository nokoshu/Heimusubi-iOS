//
//  RegisterHeimuViewController.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/23.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

class RegisterHeimuViewController: UIViewController {

    fileprivate var presenter: RegisterHeimuPresenter!
    
    @IBOutlet weak var heimuSignImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.heimuSignImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.heimuSignImageViewTapped(_:))))
        self.heimuSignImageView.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func inject(presenter: RegisterHeimuPresenter) {
        self.presenter = presenter
    }
    
    // Seach accessable heimu around this iPhone
    @IBAction func seachHeimuButtonPressed(_ sender: Any) {
        self.presenter.searchHeimuButtonPressed()
    }
    
    @objc func heimuSignImageViewTapped(_ sender: UITapGestureRecognizer) {
        self.presenter.heimuSignImageViewPressed()
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
