//
//  MenuView.swift
//  SplitViewAutolayout
//
//  Created by Olof on 20.01.15.
//  Copyright (c) 2015 Olosoft. All rights reserved.
//

import Cocoa

class MenuView: NSView {

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
        NSColor.blackColor().setFill()
        NSRectFill(dirtyRect)
    }
    
}
