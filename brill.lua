------------------------------------------------------------------------
-- brill.lua
-- Copyright 2021-2022 Martin Sievers
--
-- This work may be distributed and/or modified under the
-- conditions of the LaTeX Project Public License, either version 1.3
-- of this license or (at your option) any later version.
-- The latest version of this license is in
--   http://www.latex-project.org/lppl.txt
-- and version 1.3 or later is part of all distributions of LaTeX
-- version 2005/12/01 or later.
--
-- This work has the LPPL maintenance status `maintained'.
-- 
-- The Current Maintainer of this work is Martin Sievers
--
-- This work consists of the files 
-- brill.cls
-- brill.lua
-- CorpusAvesticum.tex
-- muya.bbx
-- muya.cbx
-- muya.dbx
-- muya.lua
-- xindex-brill.lua
-- xindex-muya.lua
-- xindex-muyaPassages.lua
--
-- 2022/04/30 v1.0.0
  
   function my_upper ( str )
         local z = ''
         local sectioncmd = ''
         local argument = ''
         
         print ('AAA' .. str .. 'BBB')
         sectioncmd, argument = string.match (str, "^([^{]-){(.+)}$")--$
         print ('AAA' .. sectioncmd .. 'BBB')
         -- First, replace all spaces within a pair of braces with \0 to differentiate
         -- them from whitespace outside.
         for s in argument:gsub("(%{.-%})", function(x) return x:gsub("%s+", "DDD") end):gmatch "%S+"
         do
           z = z .. s:gsub("%z+", " ")
         end
         
         -- First, uppercase all starting lowercase letters ('%l' in Lua jargon)
         -- "starting": %l is preceded by whitespace, {, or [
         -- z = z:gsub ( "[%s%[]%l" , string.upper )
         -- z = z:gsub ( "%s%l" , string.upper )
         -- Next, undo upper-casing for some words
         -- z = z:gsub ( "\0 "   , ' ')
         z = z:gsub ( " A "   , string.lower )
         z = z:gsub ( " An "  , string.lower )
         z = z:gsub ( " The " , string.lower )
         z = z:gsub ( " And " , string.lower )
         z = z:gsub ( " As "  , string.lower )
         z = z:gsub ( " At "  , string.lower )
         z = z:gsub ( " But " , string.lower )
         z = z:gsub ( " By "  , string.lower )
         z = z:gsub ( " For " , string.lower )
         z = z:gsub ( " Or "  , string.lower )
         z = z:gsub ( " Nor " , string.lower )
         z = z:gsub ( " Van " , string.lower )
         z = z:gsub ( " De "  , string.lower )
         z = z:gsub ( " In "  , string.lower )
         z = z:gsub ( " on "  , string.lower )
         z = z:gsub ( " Of "  , string.lower ) 
         z = z:gsub ( " To "  , string.lower ) 
         -- z = sectioncmd .. "{" .. z .. "}"
         return z
      end
      
      function do_titlecasing ( s )
         s = s:gsub ( "\\chapter%*?%s*%b[]%s*%b{}", my_upper )
         s = s:gsub ( "\\chapter%*?%s*%b{}", my_upper )
         s = s:gsub ( "\\addchap%*?%s*%b[]%s*%b{}", my_upper )
         s = s:gsub ( "\\section%*?%s*%b{}", my_upper )
         s = s:gsub ( "\\section%*?%s*%b[]%s*%b{}", my_upper )
         s = s:gsub ( "\\addsec%*?%s*%b{}", my_upper )
         s = s:gsub ( "\\subsection%*?%s*%b[]%s*%b{}", my_upper )
         s = s:gsub ( "\\subsection%*?%s*%b{}", my_upper )
         s = s:gsub ( "\\addsubsec%*?%s*%b[]%s*%b{}", my_upper )
         s = s:gsub ( "\\subsubsection%*?%s*%b[]%s*%b{}", my_upper )
         s = s:gsub ( "\\subsubsection%*?%s*%b{}", my_upper )
         s = s:gsub ( "\\addsubsubsec%*?%s*%b{}", my_upper )
         s = s:gsub ( "\\subthreesection%*?%s*%b[]%s*%b{}", my_upper )
         s = s:gsub ( "\\subthreesection%*?%s*%b{}", my_upper )
         s = s:gsub ( "\\subfoursection%*?%s*%b[]%s*%b{}", my_upper )
         s = s:gsub ( "\\subfoursection%*?%s*%b{}", my_upper )
         s = s:gsub ( "\\subfivesection%*?%s*%b[]%s*%b{}", my_upper )
         s = s:gsub ( "\\subfivesection%*?%s*%b{}", my_upper )
         s = s:gsub ( "\\minisec%*?%s*%b{}", my_upper )
         return s
      end
