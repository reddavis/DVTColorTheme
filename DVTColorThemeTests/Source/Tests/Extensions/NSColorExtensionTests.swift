//
//  NSColorExtensionTests.swift
//  DVTColorTheme
//
//  Created by Red Davis on 18/02/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import XCTest
@testable import DVTColorTheme


internal final class NSColorExtensionTests: XCTestCase
{
    // MARK: Setup
    
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }

    // MARK: Test DVT initialziation
    
    func testDVTStringInitialization()
    {
        let colorString  = "0.242153 0.283381 0.325653 1"
        
        do
        {
            let color = try NSColor(dvtColor: colorString)
            XCTAssertEqual(color.redComponent, 0.242153)
            XCTAssertEqual(color.greenComponent, 0.283381)
            XCTAssertEqual(color.blueComponent, 0.325653)
            XCTAssertEqual(color.alphaComponent, 1.0)
        }
        catch
        {
            XCTFail()
        }
    }
}
