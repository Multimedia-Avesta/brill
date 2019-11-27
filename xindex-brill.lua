-----------------------------------------------------------------------
--         FILE:  xindex-brill.lua
--  DESCRIPTION:  configuration file for xindex.lua
-- REQUIREMENTS:  
--       AUTHOR:  Martin Sievers
--      LICENSE:  LPPL1.3
-----------------------------------------------------------------------

if not modules then modules = { } end modules ['xindex-brill'] = {
      version = 0.16,
      comment = "main configuration to xindex.lua",
       author = "Martin Sievers",
    copyright = "Martin Sievers",
      license = "LPPL 1.3"
}

itemPageDelimiter = "\\quad "
compressPages = true
fCompress = true
minCompress = 3 
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
    { 'a', 'á', 'à', 'ä', 'å', 'æ', },
    { 'b' },
    { 'c', 'ç' },
    { 'd' },
    { 'e', 'é', 'è', 'ë' },
    { 'f' },
    { 'g' },
    { 'h' },
    { 'i', 'í', 'ì', 'ï' },
    { 'j' },
    { 'k' },
    { 'l' },
    { 'm' },
    { 'n', 'ñ' },
    { 'o', 'ó', 'ò', 'ö', 'ø', 'œ'},
    { 'p' },
    { 'q' },
    { 'r' },
    { 's', 'š', 'ß' },
    { 't' },
    { 'u', 'ú', 'ù', 'ü' , 'û'},
    { 'v' },
    { 'w' },
    { 'x' },
    { 'y', 'ý', 'ÿ' },
    { 'z', 'ž' }
}
alphabet_upper = { -- for sorting
    { ' ' },
    { 'A', 'Á', 'À', 'Ä', 'Å', 'Æ'},
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

