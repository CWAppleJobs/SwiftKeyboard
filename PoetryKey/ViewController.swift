//
//  ViewController.swift
//  PoetryKey
//
//  Created by Paolo Furlan on 09/12/14.
//  Copyright (c) 2014 Paolo Furlan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let arrayInfo = NSMutableArray()
    @IBOutlet weak var table : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor=UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        
        arrayInfo.addObject("Open your device Settings")
        arrayInfo.addObject("General")
        arrayInfo.addObject("Keyboard")
        arrayInfo.addObject("Keyboards")
        arrayInfo.addObject("Add new Keyboard")
        arrayInfo.addObject("PoetryKey")
        
        
        table.separatorStyle=UITableViewCellSeparatorStyle.None
        table.layer.cornerRadius=5.0
        table.layer.masksToBounds=true        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayInfo.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: InfoCell = table.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as InfoCell
        
        
        cell.lblNumber.text = NSString(format: "%d", indexPath.row+1)
        
        cell.lblDesc.text = NSString(format: "%@", arrayInfo[indexPath.row] as NSString)
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

