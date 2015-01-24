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
    

    @IBAction func But1Click(sender: AnyObject) {
        let splitVeiwController : SplitViewController = self.parentViewController! as SplitViewController
        
        splitVeiwController.showPage1View()
    }

    @IBAction func But2Click(sender: AnyObject) {
        let splitVeiwController : SplitViewController = self.parentViewController! as SplitViewController
        
        splitVeiwController.showPage2View()
    }
}
