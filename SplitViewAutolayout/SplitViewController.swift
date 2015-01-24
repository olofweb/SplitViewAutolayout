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
    
    // Supprime toutes les vues présentes dans la vue passée en paramètre
    func removeSubviewsFromView(aView : NSView) {

        for view in aView.subviews {
            view.removeFromSuperview()
        }
    }
    
    func showPage1View() {
        
        // container
        var container : NSSplitViewItem = self.splitViewItems[1] as NSSplitViewItem
        var containerViewController : NSViewController = container.viewController as NSViewController
        var containerView : NSView = containerViewController.view
        
        removeSubviewsFromView(containerView)
        
        // vue à afficher
        var page1ViewController : NSViewController = storyboard?.instantiateControllerWithIdentifier("page_1") as NSViewController
        var page1View : Page1View = page1ViewController.view as Page1View
        
        page1View.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(page1View)

        // la nouvelle vue doit prendre toute la place disponible
        containerView.addConstraint(NSLayoutConstraint(item: page1View, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0))
        
        containerView.addConstraint(NSLayoutConstraint(item: page1View, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
        
        containerView.addConstraint(NSLayoutConstraint(item: page1View, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
        
        containerView.addConstraint(NSLayoutConstraint(item: page1View, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
    }

    func showPage2View() {
        
        // container
        var container : NSSplitViewItem = self.splitViewItems[1] as NSSplitViewItem
        var containerViewController : NSViewController = container.viewController as NSViewController
        var containerView : NSView = containerViewController.view
        
        removeSubviewsFromView(containerView)
        
        // vue à afficher
        var page2ViewController : NSViewController = storyboard?.instantiateControllerWithIdentifier("page_2") as NSViewController
        var page2View : Page2View = page2ViewController.view as Page2View
        
        page2View.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(page2View)
        
        // la nouvelle vue doit prendre toute la place disponible
        containerView.addConstraint(NSLayoutConstraint(item: page2View, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0))
        
        containerView.addConstraint(NSLayoutConstraint(item: page2View, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
        
        containerView.addConstraint(NSLayoutConstraint(item: page2View, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
        
        containerView.addConstraint(NSLayoutConstraint(item: page2View, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
    }
    
    func showPage3View() {
        
        // container
        var container : NSSplitViewItem = self.splitViewItems[1] as NSSplitViewItem
        var containerViewController : NSViewController = container.viewController as NSViewController
        var containerView : NSView = containerViewController.view
        
        removeSubviewsFromView(containerView)
        
        // vue à afficher
        var secondStoryboard : NSStoryboard = NSStoryboard(name: "SecondStoryboard", bundle: nil)!
        var page3ViewController : NSViewController = secondStoryboard.instantiateControllerWithIdentifier("page_3") as NSViewController
        var page3View : Page3View = page3ViewController.view as Page3View
        
        page3View.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(page3View)
        
        // la nouvelle vue doit prendre toute la place disponible
        containerView.addConstraint(NSLayoutConstraint(item: page3View, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0))
        
        containerView.addConstraint(NSLayoutConstraint(item: page3View, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
        
        containerView.addConstraint(NSLayoutConstraint(item: page3View, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
        
        containerView.addConstraint(NSLayoutConstraint(item: page3View, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))

    }
}
