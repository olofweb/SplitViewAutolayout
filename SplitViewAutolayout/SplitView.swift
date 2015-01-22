//
//  SplitView.swift
//  SplitViewAutolayout
//
//  Created by Olof on 22.01.15.
//  Copyright (c) 2015 Olosoft. All rights reserved.
//

import Cocoa

class SplitView: NSSplitView {

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
        
//        [self addCursorRect:[self bounds] cursor:[NSCursor whateverCursorYouWant]];
    }
    
    override func resetCursorRects() {
        self.addCursorRect(self.bounds, cursor: NSCursor.arrowCursor())
    }
    
}
