//
//  CustomTableViewCell.swift
//  heimusubi-ios
//
//  Created by 竹之下遼 on 2017/11/10.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var heimuId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
