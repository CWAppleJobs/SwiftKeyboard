//
//  InfoCell.swift
//  PoetryKey
//
//  Created by Paolo Furlan on 10/12/14.
//  Copyright (c) 2014 Paolo Furlan. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet weak var lblNumber : UILabel!
    @IBOutlet weak var lblDesc : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.separatorInset=UIEdgeInsetsZero
        
        lblNumber.backgroundColor=UIColor(red: 100.0/255.0, green: 50.0/255.0, blue: 80.0/255.0, alpha: 1.0)
        lblNumber.layer.cornerRadius=lblNumber.frame.size.width/2
        lblNumber.layer.masksToBounds=true
        lblNumber.textColor=UIColor.whiteColor()
        lblNumber.textAlignment=NSTextAlignment.Center
        lblNumber.font=UIFont(name: "HelveticaNeue", size: 13)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
