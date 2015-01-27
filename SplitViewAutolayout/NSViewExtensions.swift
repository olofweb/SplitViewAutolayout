//
//  NSViewExtensions.swift
//  SplitViewAutolayout
//
//  Created by Olof on 27.01.15.
//  Copyright (c) 2015 Olosoft. All rights reserved.
//

import Foundation
import Cocoa

extension NSView {
    
    // Retourne la contrainte qui correspond à l'attribut demandé
    func getConstraintByAttribute(attribute : NSLayoutAttribute) -> NSLayoutConstraint? {
        let constraints = self.constraints
        let filteredArray = constraints.filter{ ($0 as NSLayoutConstraint).firstAttribute == attribute}
        
        if (filteredArray.count == 0) {
            return nil
        }
        
        return (filteredArray[0] as NSLayoutConstraint)
    }
   
}