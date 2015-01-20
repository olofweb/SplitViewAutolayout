//
//  SplitViewController.swift
//  SplitViewAutolayout
//
//  Created by Olof on 20.01.15.
//  Copyright (c) 2015 Olosoft. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        
        
        // pour que la MenuView fasse 64 pixels de large à l'ouverture de la fenêtre, il faut commenter 
        // cette ligne (elle n'a aucun effet)...
        self.splitView.setPosition(64, ofDividerAtIndex: 0)
        
        // ... et décommenter les lignes suivantes :
                
//        func delay(delay:Double, closure:()->()) {
//            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
//            dispatch_after(time, dispatch_get_main_queue(), closure)
//        }
//        
//        delay(0.05) {
//                    self.splitView.setPosition(64, ofDividerAtIndex: 0)
//        }
    }
}
