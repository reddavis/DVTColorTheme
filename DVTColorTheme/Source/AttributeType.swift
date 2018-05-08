//
//  AttributeType.swift
//  DVTColorTheme
//
//  Created by Red Davis on 08/05/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import Cocoa


public extension DVTColorTheme
{
    public enum AttributeType
    {
        case sourceText
        case sourceTextBackgroundColor
        case sourceCurrentLineHighlightColor
        case sourceTextSelectionColor
        case sourceCursorColor
        case sourceInvisiblesColor
        
        case consoleTextBackgroundColor
        case consoleTextSelectionColor
        case consoleCursorColor
        case consoleInstructionPointerColor
        
        case attribute
        case character
        case comment
        case documentationComment
        case documentationCommentKeyword
        case `class`
        case systemClass
        case constant
        case systemConstant
        case function
        case systemFunction
        case macro
        case systemMacro
        case type
        case systemType
        case variable
        case systemVariable
        case keyword
        case number
        case plainText
        case preprocessor
        case string
        case url
        case debuggerInput
        case debuggerOutput
        case debuggerPrompt
        case executableInput
        case executableOutput
        
        // MARK: Font
        
        internal func font(from dictionary: [String : Any]) -> Font?
        {
            let keyPath = self.fontKeypath()
            guard keyPath.count > 0 else
            {
                return nil
            }
            
            var currentDictionary = dictionary
            for key in keyPath
            {
                if key == keyPath.last,
                    let value = currentDictionary[key] as? String
                {
                    return try? Font(string: value)
                }
                
                // Next dictionary
                if let nextDictionary = currentDictionary[key] as? [String : Any]
                {
                    currentDictionary = nextDictionary
                }
                else
                {
                    return nil
                }
            }
            
            return nil
        }
        
        private func fontKeypath() -> [String]
        {
            switch self
            {
            case .sourceText:
                return ["DVTSourceTextSyntaxFonts"]
            case .attribute:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.attribute"]
            case .character:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.character"]
            case .comment:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.comment"]
            case .documentationComment:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.comment.doc"]
            case .documentationCommentKeyword:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.comment.doc.keyword"]
            case .class:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.identifier.class"]
            case .systemClass:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.identifier.class.system"]
            case .constant:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.identifier.constant"]
            case .systemConstant:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.identifier.constant.system"]
            case .function:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.identifier.function"]
            case .systemFunction:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.identifier.function.system"]
            case .macro:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.identifier.macro"]
            case .systemMacro:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.identifier.macro.system"]
            case .type:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.identifier.type"]
            case .systemType:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.identifier.type.system"]
            case .variable:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.identifier.variable"]
            case .systemVariable:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.identifier.variable.system"]
            case .keyword:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.keyword"]
            case .number:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.number"]
            case .plainText:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.plain"]
            case .preprocessor:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.preprocessor"]
            case .string:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.string"]
            case .url:
                return AttributeType.sourceText.fontKeypath() + ["xcode.syntax.url"]
            case .debuggerInput:
                return ["DVTConsoleDebuggerInputTextFont"]
            case .debuggerOutput:
                return ["DVTConsoleDebuggerOutputTextFont"]
            case .debuggerPrompt:
                return ["DVTConsoleDebuggerPromptTextFont"]
            case .executableInput:
                return ["DVTConsoleExectuableInputTextFont"]
            case .executableOutput:
                return ["DVTConsoleExectuableOutputTextFont"]
            default:
                return []
            }
        }
        
        // MARK: Name
        
        public func name() -> String
        {
            switch self
            {
            case .sourceText:
                return "Source text"
            case .attribute:
                return "Attributes"
            case .character:
                return "Characters"
            case .comment:
                return "Comments"
            case .documentationComment:
                return "Documentation Markup"
            case .documentationCommentKeyword:
                return "Documentation Markup Keywords"
            case .class:
                return "Project Class Names"
            case .systemClass:
                return "Other Class Names"
            case .constant:
                return "Project Constants"
            case .systemConstant:
                return "Other Constants"
            case .function:
                return "Project Functions"
            case .systemFunction:
                return "Other Functions"
            case .macro:
                return "Macros"
            case .systemMacro:
                return "Other Macros"
            case .type:
                return "Project Type Names"
            case .systemType:
                return "Other Type Names"
            case .variable:
                return "Project Instance Variables and Globals"
            case .systemVariable:
                return "Other Instance Variables and Globals"
            case .keyword:
                return "Keywords"
            case .number:
                return "Numbers"
            case .plainText:
                return "Plain Text"
            case .preprocessor:
                return "Preprocessor Statements"
            case .string:
                return "Strings"
            case .url:
                return "URLs"
            case .sourceTextBackgroundColor:
                return "Source Text Background Color"
            case .sourceCurrentLineHighlightColor:
                return "Source Current Line Color"
            case .sourceTextSelectionColor:
                return "Source Selection Color"
            case .sourceCursorColor:
                return "Cursor Color"
            case .sourceInvisiblesColor:
                return "Invisibles Color"
            case .debuggerInput:
                return "Debugger Console Input"
            case .debuggerOutput:
                return "Debugger Console Output"
            case .debuggerPrompt:
                return "Debugger Console Prompt"
            case .executableInput:
                return "Executable Console Input"
            case .executableOutput:
                return "Executable Console Output"
            case .consoleTextBackgroundColor:
                return "Console Text Background Color"
            case .consoleTextSelectionColor:
                return "Console Text Selection Color"
            case .consoleCursorColor:
                return "Console Cursor Color"
            case .consoleInstructionPointerColor:
                return "Console Instruction Pointer Color"
            }
        }
        
        // MARK: Color
        
        internal func color(from dictionary: [String : Any]) -> NSColor?
        {
            let keyPath = self.colorKeypath()
            guard keyPath.count > 0 else
            {
                return nil
            }
            
            var currentDictionary = dictionary
            for key in keyPath
            {
                if key == keyPath.last,
                    let value = currentDictionary[key] as? String
                {
                    return try? NSColor(dvtColor: value)
                }
                
                // Next dictionary
                if let nextDictionary = currentDictionary[key] as? [String : Any]
                {
                    currentDictionary = nextDictionary
                }
                else
                {
                    return nil
                }
            }
            
            return nil
        }
        
        private func colorKeypath() -> [String]
        {
            switch self
            {
            case .sourceText:
                return ["DVTSourceTextSyntaxColors"]
            case .sourceTextBackgroundColor:
                return ["DVTSourceTextBackground"]
            case .sourceCurrentLineHighlightColor:
                return ["DVTSourceTextCurrentLineHighlightColor"]
            case .sourceTextSelectionColor:
                return ["DVTSourceTextSelectionColor"]
            case .sourceCursorColor:
                return ["DVTSourceTextInsertionPointColor"]
            case .sourceInvisiblesColor:
                return ["DVTSourceTextInvisiblesColor"]
            case .attribute:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.attribute"]
            case .character:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.character"]
            case .comment:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.comment"]
            case .documentationComment:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.comment.doc"]
            case .documentationCommentKeyword:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.comment.doc.keyword"]
            case .class:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.identifier.class"]
            case .systemClass:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.identifier.class.system"]
            case .constant:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.identifier.constant"]
            case .systemConstant:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.identifier.constant.system"]
            case .function:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.identifier.function"]
            case .systemFunction:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.identifier.function.system"]
            case .macro:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.identifier.macro"]
            case .systemMacro:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.identifier.macro.system"]
            case .type:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.identifier.type"]
            case .systemType:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.identifier.type.system"]
            case .variable:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.identifier.variable"]
            case .systemVariable:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.identifier.variable.system"]
            case .keyword:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.keyword"]
            case .number:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.number"]
            case .plainText:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.plain"]
            case .preprocessor:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.preprocessor"]
            case .string:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.string"]
            case .url:
                return AttributeType.sourceText.colorKeypath() + ["xcode.syntax.url"]
            case .debuggerInput:
                return ["DVTConsoleDebuggerInputTextColor"]
            case .debuggerOutput:
                return ["DVTConsoleDebuggerOutputTextColor"]
            case .debuggerPrompt:
                return ["DVTConsoleDebuggerPromptTextColor"]
            case .executableInput:
                return ["DVTConsoleExectuableInputTextColor"]
            case .executableOutput:
                return ["DVTConsoleExectuableOutputTextColor"]
            case .consoleTextBackgroundColor:
                return ["DVTConsoleTextBackgroundColor"]
            case .consoleTextSelectionColor:
                return ["DVTConsoleTextSelectionColor"]
            case .consoleCursorColor:
                return ["DVTConsoleTextInsertionPointColor"]
            case .consoleInstructionPointerColor:
                return ["DVTDebuggerInstructionPointerColor"]
            }
        }
    }
}
