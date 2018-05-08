//
//  NSColor+Extensions.swift
//  DVTColorTheme
//
//  Created by Red Davis on 18/02/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import Cocoa


internal extension NSColor
{
    // MARK: Initialization
    
    internal convenience init(dvtColor: String) throws
    {
        let colorComponents = dvtColor.split(separator: " ").map { (substring) -> String in
            return String(substring)
        }
        
        let numberFormatter = NumberFormatter()
        guard colorComponents.count == 4,
              let red = numberFormatter.number(from: colorComponents[0]),
              let green = numberFormatter.number(from: colorComponents[1]),
              let blue = numberFormatter.number(from: colorComponents[2]),
              let alpha = numberFormatter.number(from: colorComponents[3]) else
        {
            throw InitializationError.invalidDVTColor
        }
        
        self.init(red: CGFloat(truncating: red), green: CGFloat(truncating: green), blue: CGFloat(truncating: blue), alpha: CGFloat(truncating: alpha))
    }
}


// MARK: Initialization error

internal extension NSColor
{
    internal enum InitializationError: Error
    {
        case invalidDVTColor
    }
}
