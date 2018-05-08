//
//  XcodeThemeConsoleTests.swift
//  DVTColorTheme
//
//  Created by Red Davis on 12/04/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import XCTest
@testable import DVTColorTheme


internal final class ConsoleTests: XCTestCase
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
            let console = try DVTColorTheme.Console(dictionary: self.themeOneDictionary)
            
            // Debugger input
            let debuggerInputColor = NSColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            XCTAssertEqualOptional(debuggerInputColor, console.debuggerInput.color)
            XCTAssertEqualOptional("SFMono-Bold", console.debuggerInput.font?.name)
            
            // Debugger output
            XCTAssertEqualOptional(debuggerInputColor, console.debuggerOutput.color)
            XCTAssertEqualOptional("SFMono-Regular", console.debuggerOutput.font?.name)
            
            // Debugger prompt
            XCTAssertEqualOptional(debuggerInputColor, console.debuggerPrompt.color)
            XCTAssertEqualOptional("SFMono-Bold", console.debuggerPrompt.font?.name)
            
            // Debugger prompt
            XCTAssertEqualOptional(debuggerInputColor, console.debuggerPrompt.color)
            XCTAssertEqualOptional("SFMono-Bold", console.debuggerPrompt.font?.name)
            
            // Executable input
            XCTAssertEqualOptional(debuggerInputColor, console.executableInput.color)
            XCTAssertEqualOptional("SFMono-Regular", console.executableInput.font?.name)
            
            // Executable output
            XCTAssertEqualOptional(debuggerInputColor, console.executableOutput.color)
            XCTAssertEqualOptional("SFMono-Bold", console.executableOutput.font?.name)
            
            // Background color
            let backgroundColor = NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            XCTAssertEqual(backgroundColor, console.backgroundColor)
            
            // Text selection color
            let textSelectionColor = NSColor(red: 0.642038, green: 0.802669, blue: 0.999195, alpha: 1.0)
            XCTAssertEqual(textSelectionColor, console.textSelectionColor)
            
            // Cursor color
            XCTAssertEqual(debuggerInputColor, console.cursorColor)
            
            // Instruction pointer color
            let instructionPointerColor = NSColor(red: 0.705792, green: 0.8, blue: 0.544, alpha: 1.0)
            XCTAssertEqual(instructionPointerColor, console.instructionPointerColor)
        }
        catch
        {
            XCTFail()
        }
    }
}
