//
//  SplitViewController.swift
//  SplitViewAutolayout
//
//  Created by Olof on 20.01.15.
//  Copyright (c) 2015 Olosoft. All rights reserved.
//

import Cocoa
import AppKit

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
        
    func showPage1View() {
        
        // container
        var container : NSSplitViewItem = self.splitViewItems[1] as NSSplitViewItem
        var containerViewController : NSViewController = container.viewController as NSViewController
        var containerView : NSView = containerViewController.view
        
        // vue à afficher
        var page1ViewController : NSViewController = storyboard?.instantiateControllerWithIdentifier("page_1") as NSViewController
        var page1View : Page1View = page1ViewController.view as Page1View
        
        self.showView(page1View, containerView: containerView)
    }
    
    func showPage2View() {
        
        // container
        var container : NSSplitViewItem = self.splitViewItems[1] as NSSplitViewItem
        var containerViewController : NSViewController = container.viewController as NSViewController
        var containerView : NSView = containerViewController.view
        
        // vue à afficher
        var page2ViewController : NSViewController = storyboard?.instantiateControllerWithIdentifier("page_2") as NSViewController
        var page2View : Page2View = page2ViewController.view as Page2View
        
        self.showView(page2View, containerView: containerView)
    }
        
    func showPage3View() {
        
        // container
        var container : NSSplitViewItem = self.splitViewItems[1] as NSSplitViewItem
        var containerViewController : NSViewController = container.viewController as NSViewController
        var containerView : NSView = containerViewController.view
        
        // vue à afficher
        var secondStoryboard : NSStoryboard = NSStoryboard(name: "SecondStoryboard", bundle: nil)!
        var page3ViewController : NSViewController = secondStoryboard.instantiateControllerWithIdentifier("page_3") as NSViewController
        var page3View : Page3View = page3ViewController.view as Page3View
        
        self.showView(page3View, containerView: containerView)
    }
    
    // affiche la nouvelle vue dans la vue "container" avec un effet de translation
    func showView(newView : NSView, containerView : NSView) {
        // recherche de la vue à remplacer (optionnelle)
        var oldView : NSView?
        if (containerView.subviews.count > 0) {
            oldView = containerView.subviews[0] as? NSView
        }
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(newView)
        
        // préparation des différents dicos
        let metricsDico = ["containerWidth" : containerView.frame.width]
        let newViewDico = ["newView" : newView]
        
        // la nouvelle vue doit avoir la même largeur que la vue "container"
        let constraintWidthNew = NSLayoutConstraint.constraintsWithVisualFormat("H:[newView(containerWidth)]", options: NSLayoutFormatOptions.allZeros, metrics: metricsDico, views: newViewDico)
        
        // et doit prendre la même place verticalement
        let constraintTopBottomNew = NSLayoutConstraint.constraintsWithVisualFormat("V:|[newView]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: newViewDico)
        
        // placement horizontal
        let constraintTempNew = NSLayoutConstraint.constraintsWithVisualFormat("H:|-containerWidth-[newView]", options: NSLayoutFormatOptions.allZeros, metrics: metricsDico, views: newViewDico)
        
        containerView.addConstraints(constraintWidthNew)
        containerView.addConstraints(constraintTopBottomNew)
        containerView.addConstraints(constraintTempNew)
        
        
        // animation de la translation de l'ancienne et de la nouvelle vue
        NSAnimationContext.runAnimationGroup({context in
            context.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            context.duration = 0.5
            // on déplace la nouvelle vue
            (constraintTempNew[0] as NSLayoutConstraint).animator().constant = 0
            // et aussi l'ancienne vue, si elle existe et si la contrainte adéquate a été trouvée
            if (oldView != nil) {
                if let constraintLeftOld = oldView!.getConstraintByAttribute(NSLayoutAttribute.Left) as NSLayoutConstraint? {
                    constraintLeftOld.animator().constant = -containerView.frame.width
                }
            }
            }, completionHandler: {
                // suppression des contraintes Width et Leading
                containerView.removeConstraint(constraintTempNew[0] as NSLayoutConstraint)
                containerView.removeConstraint(constraintWidthNew[0] as NSLayoutConstraint)
                // pour les remplacer par une contrainte par rapport à la superview
                let constraintLeadingTrailingNew = NSLayoutConstraint.constraintsWithVisualFormat("H:|[newView]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: newViewDico)
                containerView.addConstraints(constraintLeadingTrailingNew)
                
                // suppression de l'ancienne vue, si elle existe
                if (oldView != nil) {
                    oldView!.removeFromSuperview()
                }
        })
    }
}
