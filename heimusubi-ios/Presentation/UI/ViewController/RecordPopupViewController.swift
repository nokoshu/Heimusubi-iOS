//
//  RecordPopupViewController.swift
//  heimusubi-ios
//
//  Created by 竹之下遼 on 2017/11/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

class RecordPopupViewController: UIViewController {
    fileprivate var presenter: RecordPopupPresenter!
    
    @IBOutlet weak var recordImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)

        // Setting for UIVisualEffectView
        let visualEffectView = UIVisualEffectView(frame: view.frame)
        visualEffectView.effect = UIBlurEffect(style: .dark)
        view.insertSubview(visualEffectView, at: 0)
        
        self.recordImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.heimuSignImageViewTapped(_:))))
        self.recordImageView.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func inject(presenter: RecordPopupPresenter) {
        self.presenter = presenter
    }
    
    @objc func heimuSignImageViewTapped(_ sender: UITapGestureRecognizer) {
        self.presenter.heimuSignImageViewPressed()
    }

}
