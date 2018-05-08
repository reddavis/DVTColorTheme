//
//  SourceEditorTests.swift
//  DVTColorThemeTests
//
//  Created by Red Davis on 17/02/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import XCTest
@testable import DVTColorTheme


internal final class SourceEditorTests: XCTestCase
{
    // Internal
    internal var themeOneDictionary: [String : Any]!
    
    // MARK: Setup
    
    override func setUp()
    {
        super.setUp()
        
        self.themeOneDictionary = self.themeDictionary(filename: "Theme1.dvtcolortheme")
    }
    
    override func tearDown()
    {
        super.tearDown()
    }

    // MARK: Colors
    
    internal func testEditorColors()
    {
        do
        {
            let sourceEditor = try DVTColorTheme.SourceEditor(dictionary: self.themeOneDictionary)
            
            // Source text background color
            let backgroundColor = NSColor(red: 0.0818335, green: 0.109459, blue: 0.131347, alpha: 1.0)
            XCTAssertEqual(sourceEditor.backgroundColor, backgroundColor)
            
            // Current line highlight color
            let currentLineColor = NSColor(red: 0.0991081, green: 0.123696, blue: 0.149862, alpha: 1.0)
            XCTAssertEqual(sourceEditor.currentLineColor, currentLineColor)
            
            // Text selection color
            let textSelectionColor = NSColor(red: 0.156863, green: 0.196078, blue: 0.227451, alpha: 1.0)
            XCTAssertEqual(sourceEditor.textSelectionColor, textSelectionColor)
            
            // Cursor color
            let cursorColor = NSColor(red: 0.368627, green: 0.768627, blue: 1.0, alpha: 1.0)
            XCTAssertEqual(sourceEditor.cursorColor, cursorColor)
            
            // Invisibles color
            let invisiblesColor = NSColor(red: 0.254902, green: 0.313725, blue: 0.368627, alpha: 1.0)
            XCTAssertEqual(sourceEditor.invisiblesColor, invisiblesColor)
        }
        catch
        {
            XCTFail()
        }
    }
}
