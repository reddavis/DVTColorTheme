//
//  DVTColorTheme.swift
//  DVTColorTheme
//
//  Created by Red Davis on 17/02/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import Foundation


public final class DVTColorTheme
{
    // Public
    public let sourceEditor: SourceEditor
    public let console: Console
    
    // MARK: Initialization
    
    public convenience init(fileURL: URL) throws
    {
        let data = try Data(contentsOf: fileURL)
        try self.init(data: data)
    }
    
    public init(data: Data) throws
    {
        let propertyList = try PropertyListSerialization.propertyList(from: data, options: [], format: nil)
        
        guard let dictionary = propertyList as? [String : Any] else
        {
            throw InitializationError.invalidFormat
        }
        
        self.sourceEditor = try SourceEditor(dictionary: dictionary)
        self.console = try Console(dictionary: dictionary)
    }
}


// MARK: Initialization Error

public extension DVTColorTheme
{
    public enum InitializationError: LocalizedError
    {
        case invalidFormat
        
        // MARK: Description
        
        public var errorDescription: String? {
            switch self
            {
            case .invalidFormat:
                return "The theme's XML is invalid"
            }
        }
    }
}
