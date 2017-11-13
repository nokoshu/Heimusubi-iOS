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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)

        // UIVisualEffectViewを生成する
        let visualEffectView = UIVisualEffectView(frame: view.frame)
        // エフェクトの種類を設定
        visualEffectView.effect = UIBlurEffect(style: .dark)
        // UIVisualEffectViewを他のビューの下に挿入する
        view.insertSubview(visualEffectView, at: 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func inject(presenter: RecordPopupPresenter) {
        self.presenter = presenter
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
