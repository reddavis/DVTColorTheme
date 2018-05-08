# DVTColorTheme

## An Xcode Theme Parser

[![BuddyBuild](https://dashboard.buddybuild.com/api/statusImage?appID=5ad768595918c10001e582cd&branch=master&build=latest)](https://dashboard.buddybuild.com/apps/5ad768595918c10001e582cd/build/latest?branch=master)


### Install

```
github "reddavis/DVTColorTheme"
```

### Example

To initialize:

```
let theme = try DVTColorTheme(fileURL: url)

// OR

let theme = try DVTColorTheme(data: data)

```

Examples:

```
theme.sourceEditor // => DVTColorTheme.SourceEditor
theme.console // => DVTColorTheme.Console

theme.sourceEditor.backgroundColor // => NSColor
theme.sourceEditor.textSelectionColor // => NSColor

theme.sourceEditor.classes // => DVTColorTheme.Attribute
theme.sourceEditor.numbers // => DVTColorTheme.Attribute

theme.sourceEditor.plainText.color // => NSColor

theme.sourceEditor.plainText.font // => DVTColorTheme.Font
theme.sourceEditor.plainText.font.name // => String
theme.sourceEditor.plainText.font.size // => Double
theme.sourceEditor.plainText.font.isInstalled // => Bool
theme.sourceEditor.plainText.font.font // => NSFont

```

To find all available properties, checkout: `Console.swift` and `SourceEditor.swift`

### Note

This library is part of a larger project I'm working on, therefore the API is likely to change a lot.

### License

[MIT License](http://www.opensource.org/licenses/MIT).
