-----------------------------------------------------------------------
--         FILE:  xindex-muyaPassages.lua
--  DESCRIPTION:  configuration file for xindex.lua
-- REQUIREMENTS:  
--       AUTHOR:  Martin Sievers
--      LICENSE:  LPPL1.3
-----------------------------------------------------------------------

if not modules then modules = { } end modules ['xindex-muyaPassages'] = {
      version = 0.34,
      comment = "Custom config file for MuYa project",
       author = "Martin Sievers",
    copyright = "Martin Sievers",
      license = "LPPL 1.3"
}

itemPageDelimiter = "\\quad "
compressPages     = true
fCompress         = false
minCompress       = 1 
rangeSymbol       = "--"
numericPage       = true
sublabels         = {"", "", "", ""}
pageNoPrefixDel   = ""
indexOpening      = ""
idxnewletter      = "\\textbf"  -- Only valid if -n is not set
envStart          = "\\begin{theindex}"  
envStop           = "\\end{theindex}"

--[[
Each character's position in this array-like table determines its 'priority'.
Several characters in the same slot have the same 'priority'.
]]
alphabet_lower = { --   for sorting
   { ' ' },  -- only for internal tests
   { 'a', 'á', 'à', 'ä', 'â', 'å', 'æ', },
   { 'b' },
   { 'c', 'ç' },
   { 'd' },
   { 'e', 'é', 'è', 'ë', 'ê' },
   { 'f' },
   { 'g' },
   { 'h' },
   { 'i', 'í', 'ì', 'î', 'ï' },
   { 'j' },
   { 'k' },
   { 'l' },
   { 'm' },
   { 'n', 'ñ' },
   { 'o', 'ó', 'ò', 'ö', 'ô', 'ø', 'œ', 'ø'},
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
   { 'A', 'Á', 'À', 'Ä', 'Å', 'Æ', 'Â' },
   { 'B' },
   { 'C', 'Ç' },
   { 'D' },
   { 'E', 'È', 'É', 'Ë', 'Ê' },
   { 'F' },
   { 'G' },
   { 'H' },
   { 'I', 'Í', 'Ì', 'Ï', 'Î' },
   { 'J' },
   { 'K' },
   { 'L' },
   { 'M' },
   { 'N', 'Ñ' },
   { 'O', 'Ó', 'Ò', 'Ö', 'Ø','Œ', 'Ø', 'Ô'},
   { 'P' },
   { 'Q' },
   { 'R' },
   { 'S', 'Š' },
   { 'T' },
   { 'U', 'Ú', 'Ù', 'Ü', 'Û' },
   { 'V' },
   { 'W' },
   { 'X' },
   { 'Y', 'Ý', 'Ÿ' },
   { 'Z', 'Ž' }
}
