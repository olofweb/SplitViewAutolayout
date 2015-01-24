//
//  ContainerView.swift
//  SplitViewAutolayout
//
//  Created by Olof on 22.01.15.
//  Copyright (c) 2015 Olosoft. All rights reserved.
//

import Cocoa

class ContainerView: NSView {

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
        NSColor.grayColor().setFill()
        NSRectFill(dirtyRect)
    }
    
}
