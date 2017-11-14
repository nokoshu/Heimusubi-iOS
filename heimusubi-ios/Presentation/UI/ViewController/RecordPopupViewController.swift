//
//  RecordPopupViewController.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/11/13.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

class RecordPopupViewController: UIViewController {
    fileprivate var presenter: RecordPopupPresenter!
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var recordImageView: UIImageView!
    @IBOutlet weak var closeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.popupView.layer.cornerRadius = 30
        self.popupView.layer.masksToBounds = true

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        // Setting for UIVisualEffectView
        let visualEffectView = UIVisualEffectView(frame: view.frame)
        visualEffectView.effect = UIBlurEffect(style: .dark)
        view.insertSubview(visualEffectView, at: 0)
        
        // handling for recordImageView
        self.recordImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.recordImageViewTapped(_:))))
        self.recordImageView.isUserInteractionEnabled = true
        
        // handling for closeImageView
        self.closeImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.closeImageViewTapped(_:))))
        self.closeImageView.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func inject(presenter: RecordPopupPresenter) {
        self.presenter = presenter
    }
    
    @objc func recordImageViewTapped(_ sender: UITapGestureRecognizer) {
        self.presenter.recordImageTapped()
    }
    
    @objc func closeImageViewTapped(_ sender:  UITapGestureRecognizer) {
        self.presenter.closeImageTapped()
    }

}
