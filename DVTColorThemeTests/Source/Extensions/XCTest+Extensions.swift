//
//  XCTest+Extensions.swift
//  DVTColorTheme
//
//  Created by Red Davis on 17/02/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import XCTest


internal extension XCTest
{
    internal var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    internal func themeDictionary(filename: String) -> [String : Any]
    {
        let fileURL = self.bundle.url(forResource: filename, withExtension: nil)!
        let data = try! Data(contentsOf: fileURL)
        
        return try! PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String : Any]
    }
}
