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
    
    func test() {
        
        // container
        var container : NSSplitViewItem = self.splitViewItems[1] as NSSplitViewItem
        var containerViewController : NSViewController = container.viewController as NSViewController
        var containerView : NSView = containerViewController.view
        
        // vue à afficher
        var page1ViewController : NSViewController = storyboard?.instantiateControllerWithIdentifier("page_1") as NSViewController
        var page1View : Page1View = page1ViewController.view as Page1View
        
//        page1View.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(page1View)
    
        
//        containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[page1View]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: ["page1View": page1View]))

        
//        self.mainViewController = [[MainViewController alloc] initWithNibName:@"MainViewContoller" bundle:nil];
//        NSView *containerView = self.window.contentView;
//        NSView *contentView = self.mainViewController.view;
//        [contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
//        [containerView addSubview:contentView];
//        
//        NSDictionary *viewBindings = NSDictionaryOfVariableBindings(contentView);
//        [containerView addConstraints:[NSLayoutConstraints constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:nil views:viewBindings];
//        [containerView addConstraints:[NSLayoutConstraints constraintsWithVisualFormat:@"V:|[contentView]|" options:0 metrics:nil views:viewBindings];
      
        containerView.addConstraint(NSLayoutConstraint(item: page1View, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0))
        
        containerView.addConstraint(NSLayoutConstraint(item: page1View, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0))

        //          containerView.addConstraint(NSLayoutConstraint(item: page1View, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
//
//        containerView.addConstraint(NSLayoutConstraint(item: page1ViewController.view, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
    }
}
