-----------------------------------------------------------------------
--         FILE:  xindex-muya.lua
--  DESCRIPTION:  configuration file for xindex.lua
-- REQUIREMENTS:  
--       AUTHOR:  Martin Sievers
--      LICENSE:  LPPL1.3
-----------------------------------------------------------------------

if not modules then modules = { } end modules ['xindex-muya'] = {
      version = 0.13,
      comment = "",
       author = "Martin Sievers",
    copyright = "Martin Sievers",
      license = "LPPL 1.3"
}

itemPageDelimiter = "\\quad "
compressPages = true
fCompress = false
minCompress = 1 
rangeSymbol = "--"
numericPage = true
sublabels = {"", "", "", ""}
pageNoPrefixDel   = ""
indexOpening      = ""

--[[
    Each character's position in this array-like table determines its 'priority'.
    Several characters in the same slot have the same 'priority'.
--]]
alphabet_lower = { --   for sorting
    { ' ' },  -- only for internal tests
    { 'a', 'á', 'à', 'ä', 'å', 'æ' },
    { 'ā' },
    { 'ā̊' },
    { 'ą' },
    { 'b' },
    { 'β' },
    { 'c', 'ç' },
    { 'd' },
    { 'δ' },
    { 'e', 'é', 'è', 'ë' },
    { 'ē' },
    { 'ə' },
    { 'ə̄' },
    { 'f' },
    { 'g', 'ĝ' },
    { 'γ' },
    { 'h' },
    { 'i', 'í', 'ì', 'ï' },
    { 'ī' },
    { 'j' },
    { 'k' },
    { 'l' },
    { 'm' },
    { 'n', 'ñ' },
    { 'ń' },
    { 'ṇ' },
    { 'ŋ' },
    { 'ŋ́ ' },
    { 'ŋv' },
    { 'o', 'ó', 'ò', 'ö', 'ø', 'œ' },
    { 'ō' },
    { 'p' },
    { 'q' },
    { 'r', 'ṛ' },
    { 's' },
    { 'š' },
    { 'š́' },
    { 'ṣ̌' },
    { 't' },
    { 't̰' },
    { 'ϑ', 'θ' },
    { 'u', 'ú', 'ù', 'ü' , 'û' },
    { 'ū' },
    { 'v' },
    { 'w' },
    { 'x' },
    { 'x́ ' },
    { 'xv' },
    { 'y', 'ý', 'ÿ' },
    { 'z' },
    { 'ž' }
}
alphabet_upper = { -- for sorting
    { ' ' },
    { 'A', 'Á', 'À', 'Ä', 'Å', 'Æ'},
    { 'Ā' },
    { 'B' },
    { 'C', 'Ç' },
    { 'D' },
    { 'E', 'È', 'È', 'Ë' },
    { 'F' },
    { 'G' },
    { 'H' },
    { 'I', 'Í', 'Ì', 'Ï' },
    { 'J' },
    { 'K' },
    { 'L' },
    { 'M' },
    { 'N', 'Ñ' },
    { 'O', 'Ó', 'Ò', 'Ö', 'Ø','Œ' },
    { 'P' },
    { 'Q' },
    { 'R' },
    { 'S', 'Š' },
    { 'T' },
    { 'U', 'Ú', 'Ù', 'Ü' },
    { 'V' },
    { 'W' },
    { 'X' },
    { 'Y', 'Ý', 'Ÿ' },
    { 'Z', 'Ž' }
}

