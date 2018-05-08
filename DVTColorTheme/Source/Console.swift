//
//  Console.swift
//  DVTColorTheme
//
//  Created by Red Davis on 17/02/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import Cocoa


public extension DVTColorTheme
{
    public final class Console
    {
        // Public
        public let backgroundColor: NSColor
        public let textSelectionColor: NSColor
        public let cursorColor: NSColor
        public let instructionPointerColor: NSColor
        
        public let debuggerInput: Attribute
        public let debuggerOutput: Attribute
        public let debuggerPrompt: Attribute
        public let executableInput: Attribute
        public let executableOutput: Attribute
        
        // MARK: Initialization
        
        internal init(dictionary: [String : Any]) throws
        {
            guard let backgroundColor = AttributeType.consoleTextBackgroundColor.color(from: dictionary),
                  let textSelectionColor = AttributeType.consoleTextSelectionColor.color(from: dictionary),
                  let cursorColor = AttributeType.consoleCursorColor.color(from: dictionary),
                  let instructionPointerColor = AttributeType.consoleInstructionPointerColor.color(from: dictionary) else
            {
                throw InitializationError.invalidDictionary
            }
            
            self.backgroundColor = backgroundColor
            self.textSelectionColor = textSelectionColor
            self.cursorColor = cursorColor
            self.instructionPointerColor = instructionPointerColor
            
            self.debuggerInput = Attribute(type: .debuggerInput, dictionary: dictionary)
            self.debuggerOutput = Attribute(type: .debuggerOutput, dictionary: dictionary)
            self.debuggerPrompt = Attribute(type: .debuggerPrompt, dictionary: dictionary)
            self.executableInput = Attribute(type: .executableInput, dictionary: dictionary)
            self.executableOutput = Attribute(type: .executableOutput, dictionary: dictionary)
        }
    }
}


// MARK: InitializationError

internal extension DVTColorTheme.Console
{
    internal enum InitializationError: Error
    {
        case invalidDictionary
    }
}
