//
//  Attribute.swift
//  DVTColorTheme
//
//  Created by Red Davis on 17/02/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import Cocoa


public extension DVTColorTheme
{
    public struct Attribute
    {
        // Public
        public let type: AttributeType
        public let font: Font?
        public let color: NSColor?
        
        // MARK: Initialization
        
        internal init(type: AttributeType, dictionary: [String : Any])
        {
            self.type = type
            self.font = type.font(from: dictionary)
            self.color = type.color(from: dictionary)
        }
    }
}
