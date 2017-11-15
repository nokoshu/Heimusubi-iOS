//
//  MainViewController.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/16.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    fileprivate var presenter: MainPresenter!
    
    @IBOutlet weak var heimuImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.heimuImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.heimuImageViewTapped(_:))))
        self.heimuImageView.isUserInteractionEnabled = true
    }
    
    func inject(presenter: MainPresenter) {
        self.presenter = presenter
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func heimuImageViewTapped(_ sender: UITapGestureRecognizer) {
        self.presenter.heimuSignImageViewPressed()
    }


}
