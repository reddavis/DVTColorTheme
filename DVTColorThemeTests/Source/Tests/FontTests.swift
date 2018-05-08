//
//  FontTests.swift
//  DVTColorThemeTests
//
//  Created by Red Davis on 18/02/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import XCTest
@testable import DVTColorTheme


internal final class FontTests: XCTestCase
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
    
    // MARK: Initialization with DVT string
    
    internal func testInitializationFontInstalled()
    {
        do
        {
            let dvtSystemFontString = ".AppleSystemUIFont - 15.0"
            let themeFont = try DVTColorTheme.Font(string: dvtSystemFontString)
            
            XCTAssertEqual(themeFont.name, ".AppleSystemUIFont")
            XCTAssertEqual(themeFont.size, 15.0)
            XCTAssertTrue(themeFont.isInstalled)
            XCTAssertNotNil(themeFont.font)
            XCTAssertEqual(themeFont.font?.pointSize, 15.0)
            XCTAssertEqual(themeFont.font?.fontName, ".AppleSystemUIFont")
        }
        catch
        {
            XCTFail()
        }
    }
}
