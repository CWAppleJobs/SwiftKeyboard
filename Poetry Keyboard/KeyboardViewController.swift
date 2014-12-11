//
//  KeyboardViewController.swift
//  Poetry Keyboard
//
//  Created by Paolo Furlan on 10/12/14.
//  Copyright (c) 2014 Paolo Furlan. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController, UITableViewDataSource, UITableViewDelegate {

    let arrayText = NSMutableArray()
    let myTimer = NSTimer()

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        arrayText.addObject("Aenean lacinia bibendum nulla sed consectetur. Maecenas sed diam eget risus varius blandit sit amet non magna.")
        arrayText.addObject("Donec id elit non mi porta gravida at eget metus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Nullam id dolor id nibh ultricies vehicula ut id elit.")
        arrayText.addObject("Curabitur blandit tempus porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec id elit non mi porta gravida at eget metus. Etiam porta sem malesuada magna mollis euismod.")
        arrayText.addObject("Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nullam id dolor id nibh ultricies vehicula ut id elit. Vestibulum id ligula porta felis euismod semper. Aenean lacinia bibendum nulla sed consectetur. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.")
        arrayText.addObject("Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ullamcorper nulla non metus auctor fringilla. Etiam porta sem malesuada magna mollis euismod. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Vestibulum id ligula porta felis euismod semper. Vestibulum id ligula porta felis euismod semper.")
        arrayText.addObject("Donec ullamcorper nulla non metus auctor fringilla. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Nullam quis risus eget urna mollis ornare vel eu leo. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.")
        
        let table = tableText()
        self.view.addSubview(table)
        
        let bottom = viewBottom()
        self.view.addSubview(bottom)

    }

    //tableview
    func tableText() -> UITableView {
        let table = UITableView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-49))
        table.delegate=self
        table.dataSource=self
        table.backgroundColor=UIColor.clearColor()
        table.showsVerticalScrollIndicator=false
        
        return table
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayText.count
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        return stringHeightWith(15, width: self.view.frame.size.width-20, index: indexPath.row)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: TextCell = TextCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        
        cell.setLabel(NSString(format: "%@", arrayText[indexPath.row] as NSString), frame: CGRectMake(0, 0, self.view.frame.size.width, 0))
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let title = arrayText[indexPath.row] as NSString
        var proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.insertText(title)
    }
    
    
    
    
    //bottom part
    func viewBottom() -> UIView {
        let v = UIView(frame: CGRectMake(0, self.view.frame.size.height-49, self.view.frame.size.width, 49))
        v.backgroundColor=UIColor.lightGrayColor()
        
        let next = btnNext(CGRectMake(10, 8, 40, 32.5))
        v.addSubview(next)
        
        let space = btnSpace(CGRectMake(next.frame.size.width+20, 8, self.view.frame.size.width-70-(next.frame.origin.x+next.frame.size.width), 32.5))
        v.addSubview(space)
        
        let delete = btnDelete(CGRectMake(self.view.frame.size.width-50, 8, 40, 32.5))
        v.addSubview(delete)
        
        return v
    }
    
    
    //button Next Keyboard
    func btnNext(frame : CGRect) -> UIButton {
        let b = UIButton(frame: frame)
        
        b.layer.cornerRadius=3.0
        b.layer.masksToBounds=true
        b.backgroundColor=UIColor.whiteColor()

        let image = UIImage(named: "changeKeyboard")
        let imgNext : UIImageView = UIImageView(frame: CGRectMake(b.frame.size.width/2-10, b.frame.size.height/2-10, 20, 20))
        imgNext.image=image
        b.addSubview(imgNext)
        
        b.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        return b
    }

    //button Space Keyboard
    func btnSpace(frame : CGRect) -> UIButton {
        let b = UIButton(frame: frame)
        
        b.layer.cornerRadius=3.0
        b.layer.masksToBounds=true
        b.backgroundColor=UIColor.whiteColor()
        b.setTitleColor(UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1.0), forState: UIControlState.Normal)
        b.titleLabel?.font=UIFont(name: "HelveticaNeue", size: 14)
        b.setTitle("Space", forState: UIControlState.Normal)
        b.addTarget(self, action: "space", forControlEvents: .TouchUpInside)
        
        return b
    }
    
    func space() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.insertText(" ")
    }

    
    //button Delete Keyboard
    func btnDelete(frame : CGRect) -> UIButton {
        let b = UIButton(frame: frame)
        
        b.layer.cornerRadius=3.0
        b.layer.masksToBounds=true
        b.backgroundColor=UIColor.whiteColor()

        let image = UIImage(named: "delete")
        let imgDelete : UIImageView = UIImageView(frame: CGRectMake(b.frame.size.width/2-10.5, b.frame.size.height/2-8, 21.5, 16))
        imgDelete.image=image
        b.addSubview(imgDelete)

        b.addTarget(self, action: "delete", forControlEvents: .TouchUpInside)
//        b.addTarget(self, action: "deleteIsDown", forControlEvents: .TouchDown)
//        b.addTarget(self, action: "deleteIsReleased", forControlEvents: .TouchUpInside)
        
        return b
    }
    
    func delete() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.deleteBackward()
    }

    //I don't know why but i get an error that tells me that i can't assign self to the target of myTimer
//    func deleteIsDown() {
//        myTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "delete", userInfo: nil, repeats: true)
//    }
//    
//    func deleteIsReleased() {
//        myTimer.invalidate()
//        myTimer=nil
//    }
    
    
    
    func stringHeightWith(fontSize:CGFloat,width:CGFloat,index:Int)->CGFloat {
        var font = UIFont.systemFontOfSize(fontSize)
        var size = CGSizeMake(width,CGFloat.max)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .ByWordWrapping;
        var  attributes = [NSFontAttributeName:font,
            NSParagraphStyleAttributeName:paragraphStyle.copy()]
        
        var text =  NSString(format: "%@", arrayText[index] as NSString)
        var rect = text.boundingRectWithSize(size, options:.UsesLineFragmentOrigin, attributes: attributes, context:nil)
        return rect.size.height+20
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
}
