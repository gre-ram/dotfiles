local Color, colors, Group, groups, styles = require("colorbuddy").setup()

Color.new('background', "#3B4252")
Color.new('fg', "#292929")
Color.new('nord_0', "#2E3440")
Color.new('nord_1',"#3B4252")
Color.new('nord_2', "#434C5E")
Color.new('nord_3', "#4C566A")
Color.new('nord_3_light', "#616E88")
Color.new('nord_4', "#D8DEE9")
Color.new('nord_5', "#E5E9F0")
Color.new('nord_6', "#ECEFF4")
Color.new('nord_7', "#8FBCBB")
Color.new('nord_8', "#88C0D0")
Color.new('nord_9', "#81A1C1")
Color.new('nord_10', "#5E81AC")
Color.new('nord_11', "#BF616A")
Color.new('nord_12', "#D08770")
Color.new('nord_13', "#EBCB8B")
Color.new('nord_14', "#A3BE8C")
Color.new('nord_15', "#B48EAD")

Color.new('white',     '#D8DEE9')
Color.new('red',       '#BF616A')
Color.new('green',     '#A3BE8C')
Color.new('yellow',    '#EBCB8B')
Color.new('blue',      '#81A1C1')
Color.new('aqua',      '#A3BE8C')
Color.new('cyan',      '#8FBCBB')
Color.new('purple',    '#B48EAD')
Color.new('violet',    '#B48EAD')
Color.new('orange',    '#D08770')

-- my highlight
Group.new('TabLineSel',          colors.fg,           colors.blue, styles.bold )
Group.new('TabLineSelSeparator', colors.blue,         colors.none)
Group.new('TabLine', colors.nord_4, colors.nord_2)
Group.new('TabLineSeparator', colors.nord_2, colors.none)

Group.new('Conceal',             colors.nord_3_light, colors.none)
Group.new('VertSplit', colors.nord_3, colors.none)

Group.new('Normal',         colors.none,         colors.none)
Group.new('Function',       colors.nord_8,       colors.none,    styles.bold)
Group.new('Error',          colors.nord_11,      colors.none,    styles.bold)
Group.new('ErrorMsg',       colors.nord_5,       colors.nord_11, styles.bold)
Group.new('WarningMsg',     colors.nord_5,       colors.nord_12, styles.bold)
Group.new('Boolean',        colors.nord_9,       colors.none,    styles.NONE)
Group.new('Character',      colors.nord_14,      colors.none,    styles.NONE)
Group.new('Comment',        colors.nord_3_light, colors.none,    styles.NONE)
Group.new("Conditional",    colors.nord_9,       colors.none,    styles.NONE)
Group.new("Constant",       colors.nord_4,       colors.none,    styles.NONE)
Group.new("Define",         colors.nord_9,       colors.none,    styles.NONE)
Group.new("Delimiter",      colors.nord_6,       colors.none,    styles.NONE)
Group.new("Exception",      colors.nord_9,       colors.none,    styles.NONE)
Group.new("Float",          colors.nord_15,      colors.none,    styles.NONE)
Group.new("Function",       colors.nord_8,       colors.none,    styles.NONE)
Group.new("Identifier",     colors.nord_13,       colors.none,    styles.NONE)
Group.new("Include",        colors.nord_9,       colors.none,    styles.NONE)
Group.new("Keyword",        colors.nord_9,       colors.none,    styles.italic)
Group.new("Label",          colors.nord_9,       colors.none,    styles.italic)
Group.new("Number",         colors.nord_15,      colors.none,    styles.NONE)
Group.new("Operator",       colors.nord_9,       colors.none,    styles.NONE)
Group.new("PreProc",        colors.nord_9,       colors.none,    styles.NONE)
Group.new("Repeat",         colors.nord_9,       colors.none,    styles.NONE)
Group.new("Special",        colors.nord_15,       colors.none,    styles.NONE)
Group.new("SpecialChar",    colors.nord_13,      colors.none,    styles.NONE)
Group.new("SpecialComment", colors.nord_8,       colors.none,    styles.NONE)
Group.new("Statement",      colors.nord_9,       colors.none,    styles.NONE)
Group.new("StorageClass",   colors.nord_9,       colors.none,    styles.NONE)
Group.new("String",         colors.nord_14,      colors.none,    styles.NONE)
Group.new("Structure",      colors.nord_9,       colors.none,    styles.NONE)
Group.new("Tag",            colors.nord_4,       colors.none,    styles.NONE)
Group.new("Title",          colors.nord_4,       colors.none)
Group.new("Todo",           colors.nord_13,      colors.none,    styles.NONE)
Group.new("Type",           colors.nord_9,       colors.none,    styles.italic)
Group.new("Typedef",        colors.nord_9,       colors.none,    styles.NONE)
Group.new("CursorColumn",   colors.nord_1,       colors.none,    styles.NONE)
Group.new("LineNr",         colors.nord_9,       colors.none,    styles.NONE)
Group.new("CursorLineNr",   colors.nord_5,       colors.none,    styles.NONE)
Group.new("Line",           colors.nord_12,      colors.none,    styles.bold)
Group.new("SignColumn",     colors.none,         colors.none,    styles.NONE)

Group.new("ColorColumn", colors.none, colors.nord_1)
Group.new("Cursor", colors.nord_0, colors.nord_4)
Group.new("CursorLine", colors.none, colors.nord_0)
Group.new("iCursor",colors.nord_0, colors.nord_4)
Group.new("EndOfBuffer",colors.none, colors.none)
Group.new("MatchParen",colors.nord_8, colors.nord_3)
Group.new("NonText",colors.nord_1, colors.none)
Group.new("PMenu", colors.nord_4, colors.nord_2)
Group.new("PmenuSbar", colors.nord_4, colors.nord_2)
Group.new("PMenuSel", colors.nord_6, colors.nord_9)
Group.new("PmenuThumb", colors.nord_8, colors.nord_3)
Group.new("SpecialKey",colors.nord_3, colors.none, styles.italic)
Group.new("SpellBad",colors.nord_11, colors.nord_0)
Group.new("SpellCap",colors.nord_13, colors.nord_0)
Group.new("SpellLocal",colors.nord_5, colors.nord_0)
Group.new("SpellRare",colors.nord_6, colors.nord_0)
Group.new("Visual",colors.nord_4, colors.nord_9)
Group.new("VisualNOS",colors.nord_2, colors.nord_1)

-- "+- Neovim Support -+
Group.new("healthError",colors.nord_11, colors.nord_1)
Group.new("healthSuccess",colors.nord_14, colors.nord_1)
Group.new("healthWarning",colors.nord_13, colors.nord_1)
Group.new("TermCursorNC",colors.nord_1, colors.nord_1)
Group.new("IncSearch",colors.nord_6, colors.nord_10, styles.underline)
Group.new("Search",colors.nord_1, colors.nord_8)

-- vim
Group.new('vimcommand',      groups.Statement, colors.none)
Group.new('vimLet',          groups.vimcommand , colors.none)
Group.new('vimFuncVar',      groups.identifier, colors.none)
Group.new('vimCommentTitle', groups.PreProc, colors.none)
Group.new('vimIsCommand',    colors.none, colors.none)
Group.new('vimFuncSID',      groups.Special, colors.none)
Group.new('vimMapModKey',    groups.vimFuncSID, colors.none)
Group.new('vimMapLhs',       colors.none, colors.none)
Group.new('vimNotation',     colors.nord_7, colors.none)
Group.new('vimBracket',      groups.Delimiter, colors.none)
Group.new('vimMap',          groups.vimcommand, colors.none)
Group.new('nvimMap',         groups.vimMap, colors.none)

-- startify
Group.new("StartifyFile",colors.nord_6, colors.none)
Group.new("StartifyFooter",colors.none, colors.none)
Group.new("StartifyHeader",colors.nord_8, colors.none)
Group.new("StartifyNumber",colors.nord_7, colors.none)
Group.new("StartifyPath",colors.nord_8, colors.none)
Group.new("StartifyBracket", groups.Delimiter, groups.Delimiter)
Group.new("StartifySlash", groups.Normal, groups.Normal)
Group.new("StartifySpecial", groups.Comment, groups.Comment)

-- gitgutter
Group.new("GitGutterAdd",          colors.nord_14, colors.none)
Group.new("GitGutterDelete",       colors.nord_11, colors.none)
Group.new("GitGutterChange",       colors.nord_13, colors.none)
Group.new("GitGutterChangeDelete", colors.nord_11, colors.none)

-- built-in LSP
Group.new("LSPDiagnosticsWarning", colors.nord_13, colors.none)
Group.new("LSPDiagnosticsError", colors.nord_11, colors.none)
Group.new("LSPDiagnosticsInformation", colors.nord_8, colors.none)
Group.new("LSPDiagnosticsHint", colors.nord_10, colors.none)

-- TS
Group.new("TSDefinition", groups.Type, groups.Type, styles.italic)
Group.new("TSString", groups.String, groups.String, styles.italic)
Group.new("TSDefinitionUsage", groups.CursorLine, groups.CursorLine)

-- TeleScope
Group.new("TelescopeSelection", colors.nord_11, colors.nord_8, styles.bold)
Group.new("TelescopeNormal", groups.Pmenu, groups.Pmenu)

Group.new("TSError", colors.nord_11)
Group.new("TSPunctDelimiter", colors.nord_9)
Group.new("TSPunctBracket", colors.nord_6)
Group.new("TSPunctSpecial", colors.nord_6)
Group.new("TSConstant", colors.nord_8)
Group.new("TSConstBuiltin", colors.nord_9)
Group.new("TSConstMacro", colors.nord_7)
Group.new("TSStringRegex", colors.nord_14)
Group.new("TSString", colors.nord_14)
Group.new("TSStringEscape", colors.nord_8)
Group.new("TSCharacter", colors.nord_13)
Group.new("TSNumber", colors.nord_15)
Group.new("TSBoolean", colors.nord_9)
Group.new("TSFloat", colors.nord_15)
Group.new("TSAnnotation", colors.nord_12)
Group.new("TSAttribute", colors.nord_7)
Group.new("TSFuncBuiltin", colors.nord_7)
Group.new("TSFunction", colors.nord_8)
Group.new("TSFuncMacro", colors.nord_8)
Group.new("TSParameter", colors.nord_5)
Group.new("TSParameterReference", colors.nord_9)
Group.new("TSMethod", colors.nord_8)
Group.new("TSField", colors.nord_5)
Group.new("TSProperty", colors.nord_9)
Group.new("TSConstructor", colors.nord_9)
Group.new("TSConditional", colors.nord_9, colors.none, styles.italic)
Group.new("TSRepeat", colors.nord_15)
Group.new("TSLabel", colors.nord_9)
Group.new("TSKeyword", colors.nord_9)
Group.new("TSKeywordFunction", colors.nord_9)
Group.new("TSKeywordOperator", colors.nord_9)
Group.new("TSOperator", colors.nord_15)
Group.new("TSException", colors.nord_9)
Group.new("TSType", colors.nord_7)
Group.new("TSTypeBuiltin", colors.nord_9)
Group.new("TSNamespace", colors.nord_13)
Group.new("TSInclude", colors.nord_9)
Group.new("TSVariable", colors.nord_5)
Group.new("TSVariableBuiltin", colors.nord_10)
Group.new("TSTag", colors.nord_9)
