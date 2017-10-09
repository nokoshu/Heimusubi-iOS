//
//  SigninViewController.swift
//  heimusubi-ios
//
//  Created by 竹之下遼 on 2017/10/09.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage: UIImage = UIImage(named:"signin_background")!
        let imageView = UIImageView(image: backgroundImage)
        
        self.view.backgroundColor = UIColor.white
        
        // Screen Size の取得
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        // 画面の横幅を取得
        let imageWidth:CGFloat = backgroundImage.size.width
        let imageHeight:CGFloat = backgroundImage.size.height
        
        // 画像サイズをスクリーン幅に合わせる
        let scale = screenWidth / imageWidth
        let rect:CGRect = CGRect(x:0, y:0, width:imageWidth*scale, height:imageHeight*scale)
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)

        imageView.frame = rect;
        
        self.view.addSubview(imageView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
