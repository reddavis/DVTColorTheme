//
//  SourceEditor.swift
//  DVTColorTheme
//
//  Created by Red Davis on 17/02/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import Cocoa


public extension DVTColorTheme
{
    public final class SourceEditor
    {
        // Public
        public let backgroundColor: NSColor
        public let textSelectionColor: NSColor
        public let cursorColor: NSColor
        public let invisiblesColor: NSColor
        public let currentLineColor: NSColor?
        
        public let attributes: Attribute
        public let characters: Attribute
        public let comments: Attribute
        public let documentationComments: Attribute
        public let documentationCommentKeywords: Attribute
        public let classes: Attribute
        public let systemClasses: Attribute
        public let constants: Attribute
        public let systemConstants: Attribute
        public let functions: Attribute
        public let systemFunctions: Attribute
        public let macros: Attribute
        public let systemMacros: Attribute
        public let types: Attribute
        public let systemTypes: Attribute
        public let variables: Attribute
        public let systemVariables: Attribute
        public let keywords: Attribute
        public let numbers: Attribute
        public let plainText: Attribute
        public let preprocessors: Attribute
        public let strings: Attribute
        public let urls: Attribute
        
        // MARK: Initialization
        
        internal init(dictionary: [String : Any]) throws
        {
            guard let backgroundColor = AttributeType.sourceTextBackgroundColor.color(from: dictionary),
                  let textSelectionColor = AttributeType.sourceTextSelectionColor.color(from: dictionary),
                  let cursorColor = AttributeType.sourceCursorColor.color(from: dictionary),
                  let invisiblesColor = AttributeType.sourceInvisiblesColor.color(from: dictionary) else
            {
                throw InitializationError.invalidDictionary
            }
            
            self.backgroundColor = backgroundColor
            self.currentLineColor = AttributeType.sourceCurrentLineHighlightColor.color(from: dictionary)
            self.textSelectionColor = textSelectionColor
            self.cursorColor = cursorColor
            self.invisiblesColor = invisiblesColor
            self.attributes = Attribute(type: .attribute, dictionary: dictionary)
            self.characters = Attribute(type: .character, dictionary: dictionary)
            self.comments = Attribute(type: .comment, dictionary: dictionary)
            self.documentationComments = Attribute(type: .documentationComment, dictionary: dictionary)
            self.documentationCommentKeywords = Attribute(type: .documentationCommentKeyword, dictionary: dictionary)
            self.classes = Attribute(type: .class, dictionary: dictionary)
            self.systemClasses = Attribute(type: .systemClass, dictionary: dictionary)
            self.constants = Attribute(type: .constant, dictionary: dictionary)
            self.systemConstants = Attribute(type: .systemConstant, dictionary: dictionary)
            self.functions = Attribute(type: .function, dictionary: dictionary)
            self.systemFunctions = Attribute(type: .systemFunction, dictionary: dictionary)
            self.macros = Attribute(type: .macro, dictionary: dictionary)
            self.systemMacros = Attribute(type: .systemMacro, dictionary: dictionary)
            self.types = Attribute(type: .type, dictionary: dictionary)
            self.systemTypes = Attribute(type: .systemType, dictionary: dictionary)
            self.variables = Attribute(type: .variable, dictionary: dictionary)
            self.systemVariables = Attribute(type: .systemVariable, dictionary: dictionary)
            self.keywords = Attribute(type: .keyword, dictionary: dictionary)
            self.numbers = Attribute(type: .keyword, dictionary: dictionary)
            self.plainText = Attribute(type: .plainText, dictionary: dictionary)
            self.preprocessors = Attribute(type: .preprocessor, dictionary: dictionary)
            self.strings = Attribute(type: .string, dictionary: dictionary)
            self.urls = Attribute(type: .url, dictionary: dictionary)
        }
    }
}


// MARK: InitializationError

internal extension DVTColorTheme.SourceEditor
{
    internal enum InitializationError: Error
    {
        case invalidDictionary
    }
}
