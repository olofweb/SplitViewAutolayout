//
//  Page2View.swift
//  SplitViewAutolayout
//
//  Created by Olof on 24.01.15.
//  Copyright (c) 2015 Olosoft. All rights reserved.
//

import Cocoa

class Page2View: NSView {

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
        NSColor.greenColor().setFill()
        NSRectFill(dirtyRect)
    }
    
}
