//
//  TextCell.swift
//  PoetryKey
//
//  Created by Paolo Furlan on 10/12/14.
//  Copyright (c) 2014 Paolo Furlan. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell {

    let lblText = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.separatorInset=UIEdgeInsetsZero
      
        lblText.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        lblText.backgroundColor=UIColor.clearColor()
        lblText.numberOfLines=0;
        lblText.textAlignment=NSTextAlignment.Center
        lblText.font=UIFont(name: "HelveticaNeue", size: 15);
        lblText.textColor=UIColor(red: 120.0/255.0, green: 120.0/255.0, blue: 120.0/255.0, alpha: 1.0)
        self.addSubview(lblText)
    }
    

    func setLabel(text : NSString, frame : CGRect) {
//        if(!lblText){
        lblText.frame=CGRectMake(10, 10, frame.size.width-20, self.frame.size.height-20)
        
        lblText.text=text
        lblText.sizeToFit()
        
        lblText.frame.origin.x=frame.size.width/2-lblText.frame.size.width/2
    }
    
    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
