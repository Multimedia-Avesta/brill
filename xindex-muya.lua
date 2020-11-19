-----------------------------------------------------------------------
--         FILE:  xindex-muya.lua
--  DESCRIPTION:  configuration file for xindex.lua
-- REQUIREMENTS:  
--       AUTHOR:  Martin Sievers
--      LICENSE:  LPPL1.3
-----------------------------------------------------------------------

if not modules then modules = { } end modules ['xindex-muya'] = {
      version = 0.28,
      comment = "",
       author = "Martin Sievers",
    copyright = "Martin Sievers",
      license = "LPPL 1.3"
}

local ducet = require "lua-uca.lua-uca-ducet"
local collator = require "lua-uca.lua-uca-collator"
local languages = require "lua-uca.lua-uca-languages"
local collator_obj = collator.new(ducet)
local language = "en" -- default language

languages.av = function(collator_obj)
   local tailoring = function(s) collator_obj:tailor_string(s) end
   tailoring("&a<ā<ā̊ <ą<b<β<c<d<δ<e<ē<ǝ=ə<ǝ̄=ə̄<f<g<γ<h<i<ī<j<k<m<n<ń<ṇ<ŋ<ŋ́<ŋv<o<ō<p<r<s<š́<ṣ̌<š<t<t̰<ϑ=θ<u<ū<v<x<x́<xv<y<z<ž")
   return collator_obj
end

-- language specified on the command line doesn't seem to be available
-- in the config file, so we just try to find it ourselves
for i, a in ipairs(arg) do
   if a == "-l" or a=="--language" then
      language = arg[i+1]
      break
   end
end

if languages[language] then
   print("[Lua-UCA] Loading language: " .. language)
   collator_obj = languages[language](collator_obj)
end

local upper = unicode.utf8.upper

itemPageDelimiter = "\\quad "
compressPages = true
fCompress = false
minCompress = 1 
rangeSymbol = "--"
numericPage = true
sublabels = {"", "", "", ""}
pageNoPrefixDel   = ""
indexOpening      = ""

function UTFCompare(a,b)
   local A = a["SortKey"]
   local B = b["SortKey"]
   A = string.gsub( A, '%-', '' )
   A = string.gsub( A, '%.', '' )
   A = string.gsub( A, '%(', '' )
   A = string.gsub( A, '%)', '' )
   A = string.gsub( A, ' ', '' )
   --
   B = string.gsub( B, '%-', '' )
   B = string.gsub( B, '%.', '' )
   B = string.gsub( B, '%(', '' )
   B = string.gsub( B, '%)', '' )
   B = string.gsub( B, ' ', '' )
   return collator_obj:compare_strings(A,B)
end


--[[
    Each character's position in this array-like table determines its 'priority'.
    Several characters in the same slot have the same 'priority'.
--]]
alphabet_lower = { --   for sorting
    { ' ' },  -- only for internal tests
    { 'a' },
    { 'ā' },
    { 'ā̊' },
    { 'ą' },
    { 'b' },
    { 'β' },
    { 'c' },
    { 'd' },
    { 'δ' },
    { 'e' },
    { 'ē' },
    { 'ə' },
    { 'ə̄' },
    { 'f' },
    { 'g' },
    { 'γ' },
    { 'h' },
    { 'i' },
    { 'ī' },
    { 'j' },
    { 'k' },
    { 'l' },
    { 'm' },
    { 'n' },
    { 'ń' },
    { 'ṇ' },
    { 'ŋ' },
    { 'ŋ́ ' },
    { 'ŋv' },
    { 'o' },
    { 'ō' },
    { 'p' },
    { 'q' },
    { 'r' },
    { 's' },
    { 'š' },
    { 'š́' },
    { 'ṣ̌' },
    { 't' },
    { 't̰' },
    { 'ϑ', 'θ' },
    { 'u' },
    { 'ū' },
    { 'v' },
    { 'w' },
    { 'x' },
    { 'x́ ' },
    { 'xv' },
    { 'y' },
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



