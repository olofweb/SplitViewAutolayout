//
//  MenuViewController.swift
//  SplitViewAutolayout
//
//  Created by Olof on 22.01.15.
//  Copyright (c) 2015 Olosoft. All rights reserved.
//

import Cocoa

class MenuViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func PlusClic(sender: AnyObject) {
     
        var splitViewController : SplitViewController = self.parentViewController! as SplitViewController
        splitViewController.test()
    }
}
