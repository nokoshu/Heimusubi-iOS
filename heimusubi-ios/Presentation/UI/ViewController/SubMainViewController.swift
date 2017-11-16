//
//  SubMainViewController.swift
//  heimusubi-ios
//
//  Created by 竹之下遼 on 2017/11/15.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

class SubMainViewController: UIViewController {
    fileprivate var presenter: SubMainPresenter!
    
    @IBOutlet weak var heimuImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.heimuImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.heimuImageViewTapped(_:))))
        self.heimuImageView.isUserInteractionEnabled = true
    }
    
    func inject(presenter: SubMainPresenter) {
        self.presenter = presenter
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func heimuImageViewTapped(_ sender: UITapGestureRecognizer) {
        self.presenter.heimuSignImageViewPressed()
    }
    

}
