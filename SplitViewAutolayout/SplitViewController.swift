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
        
        var menu: NSSplitViewItem = self.splitViewItems[0] as NSSplitViewItem
        var main: NSSplitViewItem = self.splitViewItems[1] as NSSplitViewItem
        
        // le menu doit faire 64 pixels de large
        self.view.addConstraint(NSLayoutConstraint(
            item: menu.viewController.view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 64
            ))
        
        // le menu (et donc aussi la partie principale), ne doit pas faire moins de 200 pixels de haut
        self.view.addConstraint(NSLayoutConstraint(
            item: menu.viewController.view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.GreaterThanOrEqual,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 200
            ))
        
        
        // la partie principale ne doit pas faire moins de 300 pixels de large
        self.view.addConstraint(NSLayoutConstraint(
            item: main.viewController.view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.GreaterThanOrEqual,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 300
            ))
    }
}
