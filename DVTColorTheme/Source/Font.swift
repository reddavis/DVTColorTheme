//
//  Font.swift
//  XcodeThemes
//
//  Created by Red Davis on 18/02/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import Cocoa


public extension DVTColorTheme
{
    public struct Font
    {
        // Public
        public var isInstalled: Bool {
            return self.font != nil
        }
        
        public let name: String
        public let size: Double
        public let font: NSFont?
        
        // MARK: Initialization
        
        internal init(string: String) throws
        {
            let fontComponents = string.split(separator: " ").map { (substring) -> String in
                return String(substring)
            }
            
            guard let name = fontComponents.first,
                  let sizeString = fontComponents.last,
                  let size = Double(sizeString) else
            {
                throw InitializationError.invalidDVTFormat
            }
            
            self.name = name
            self.size = size
            self.font = NSFont(name: name, size: CGFloat(size))
        }
    }
}


// MARK: Initialization error

internal extension DVTColorTheme.Font
{
    internal enum InitializationError: Error
    {
        case invalidDVTFormat
        case notFound
    }
}
