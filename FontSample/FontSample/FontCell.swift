//
//  FontCell.swift
//  FontSample
//
//  Created by ikata on 2016/03/21.
//  Copyright © 2016年 BraveTechnology Inc. All rights reserved.
//

import UIKit

class FontCell: UITableViewCell {

    @IBOutlet weak var lblFont: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLabelFont(fontName: String) {
        self.lblFont.font = UIFont(name: fontName, size: 12.0)
        self.lblFont.text = fontName
    }

}
