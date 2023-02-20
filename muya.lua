------------------------------------------------------------------------
-- muya.lua
-- Copyright 2018-2023 Martin Sievers
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
-- 2023/02/20 v1.4.0
local ustring = require( 'ustring' )

function modifySorting()
   local match = ''
   local n = 0
   local g = io.open( "passages-mod.idx", "w+" )
   -- for starred index macros like \Passages*
   -- TODO: What about letters within the passage id?
   for line in io.lines( "passages.idx" ) do
   --texio.write_nl("Vorher: " .. line)
      match, n = string.gsub( line, 
         "\\gls%s*{([^}]*)}\\nobreak%s*\\hspace%s*{\\fontdimen 2\\font%s*}([%-%.%d%a]+)@\\textup%s*{.+}|", 
         function(a,b) return get_sortentry_star( a, b ) end )
      if n == 0 then
      -- now for unstarred variant
         match, n = string.gsub( line,
            "\\gls%s*{([^}]*)}\\nobreak%s*\\hspace%s*{\\fontdimen 2\\font%s*}([%-%.%d%a]+)|",
            function( a, b ) return get_sortentry( a, b ) end )
      end
   --texio.write_nl("Treffer: " .. n)
   --texio.write_nl("Nachher: " .. match)
   g:write(match .. "\n")
   --  f:close()
   end
   g:close()
end

function get_sortentry( a, b )
   -- we have to analyse b to get a correct sort string
   local res = ""
   if b:match( "^%d+$" ) then
      res = res .. string.format( "%03d", b ) .. ".000"
   else
--      if b:match( "^%d+\.%d+$" ) then
--         for v, w in string.gmatch( b, "(%d+)\.(%d+)" ) do
--            res = res .. string.format( "%03d", v ) .. "." .. string.format( "%03d", w ) .. ".000"
--         end
--      else   
         for v, w in string.gmatch( b, "(%d+)([%-%.]*)" ) do
            res = res .. string.format( "%03d%s", v, w )
         end
         for last in string.gmatch( b, ".+[%-%.]([^%-%.]+)$" ) do
            if last:match( "^%d+$" ) then
               --res = res .. string.format( "%03d", last ) .. ".000"
            else
               res = res .. last
            end
         end
--      end
   end
   return string.format( "%s%s@\\gls{%s}\\nobreak\\hspace{\\fontdimen 2\\font}%s|", a, res, a, b )
end

function get_sortentry_star( a, b ) 
   -- we have to analyse b to get a correct sort string
   local res = ""
   if b:match( "^%d+$" ) then
      res = res .. string.format( "%03d", b ) .. ".000"
   else
      for v, w in string.gmatch( b, "(%d+)([%-%.]*)" ) do
         res = res .. string.format( "%03d%s", v, w )
      end
      for last in string.gmatch( b, ".+[%-%.]([^%-%.]+)$" ) do
         if last:match( "^%d+$" ) then
            --res = res .. string.format( "%03d", last ) .. ".000"
         else
            res = res .. last
         end
      end
   end
      return string.format( "%s%s@\\gls{%s}\\nobreak\\hspace{\\fontdimen 2\\font}%s|", a, res, a, b )
end

function modifySorting_words()
   local match = ''
   local g = io.open( "words-mod.idx", "w+" )
   for line in io.lines( "words.idx" ) do
      --texio.write_nl("Vorher: " .. line)
      match = ustring.gsub( line, 
      '(.+@.+)![*⁺](.+@.+)', '%1!%2' ) 
      match = ustring.gsub( match, 
      '(.+@.+)!²(.+)(@.+)', '%1!%22%3' ) 
      match = ustring.gsub( match, 
      '(.+@.+)!³(.+)(@.+)', '%1!%23%3' ) 
      --texio.write_nl("Nachher: " .. match)
      g:write(match .. "\n")
   end
   g:close()
end

-- see if the file exists
function file_exists( file )
  local f = io.open( file, "rb" )
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from( file )
  if not file_exists( file ) then return {} end
  lines = {}
  for line in io.lines( file ) do 
    lines[#lines + 1] = line
  end
  return lines
end

function sortGlossary( l )
   -- tests the functions above
   local file = status.filename
   local outfile = 'dictionaryconv.tex'
   if l == nil or l == '' then
      texio.write_nl( "Glossary language must not be empty" )
   else
      glosslang = l
      --texio.write_nl( "Found sorting language: " .. glosslang )
   end
   if not file_exists( file ) then return {} end
   
   local lines = lines_from( file )
   local text = ""
   local sublemmatext = ""      
   local subsublemmatext = ""      
   local subsubsublemmatext = ""      
   --local str = ""
   local prevlemma = ""
   local prevsublemma = ""
   local prevsublemmastar = ""
   local prevsubsublemma = ""
   local prevsubsublemmastar = ""
   local prevsubsubsublemma = ""
   local prevsubsubsublemmastar = ""
   local lemma = ""
   local sublemma = ""
   local subsublemma = ""
   local subsubsublemma = ""
   local lemmacontent = ""
   local sublemmacontent = ""
   local sublemmastarcontent = ""
   local subsublemmacontent = ""
   local subsublemmastarcontent = ""
   local subsubsublemmacontent = ""
   local subsubsublemmastarcontent = ""
--
   local result = {}
   local sl = {}
   local slstar = {}
   local ssl = {}
   local sslstar = {}
   local sssl = {}
   local ssslstar = {}
--   
   local is_sublemmastar = false
   local is_subsublemmastar = false
   local is_subsubsublemmastar = false
--
   local newkeys = {}
   local is_indictionary = false
   local is_insublemmata = false
   local is_insubsublemmata = false
   local is_insubsubsublemmata = false   
   local f = assert( io.open(outfile, "w+") )
   local hash = {}
   local res = {}

   
   -- we define a loop routine for each possible language
   
   -- Gujarati
   if glosslang == "Guj" then
   for k, v in pairs( lines ) do
      -- get line k and process it
      local str = lines[k]
      
      if string.match( str, "^%s*\\begin{Dictionary}" ) then
         f:write( "\\begin{ModDictionary}" )
         is_indictionary = true
      elseif string.match( str, "^%s*\\begin{Sublemmata}" ) then
         is_insublemmata = true
         -- Write line to top-level structure
         sublemmacontent = "\n\\begin{Sublemmata}\n"
         -- define empty tables for sublemmata environment
         sl = {}
         slstar = {}
      elseif string.match( str, "^%s*\\begin{Subsublemmata}" ) then
         is_insubsublemmata = true
         -- Write line to top-level structure
         subsublemmacontent = "\n\\begin{Subsublemmata}\n"
         -- define empty tables for sublemmata environment
         ssl = {}
         sslstar = {}
      elseif string.match( str, "^%s*\\begin{Subsubsublemmata}" ) then
         is_insubsubsublemmata = true
         -- Write line to top-level structure
         subsubsublemmacontent = "\n\\begin{Subsubsublemmata}\n"
         -- define empty tables for sublemmata environment
         sssl = {}
         ssslstar = {}
      elseif string.match( str, "^%s*\\end{Subsubsublemmata}" ) then
         if next( ssslstar ) ~= nil then
            subsubsublemmastarcontent = ''
            local lastval = sssl[prevsubsubsublemma]
            ssslstar[prevsubsubsublemma] = lastval
            sssl[prevsubsubsublemma] = nil
            newkeys = sortLemma( ssslstar )
            local firstentry = true
            for _, k in ipairs( newkeys ) do
               if firstentry == true then
                  sssl[k] = ssslstar[k]  
                  firstentry = false
                  prevsubsubsublemma = k
               else
                  subsubsublemmastarcontent = subsubsublemmastarcontent .. "\n" .. 
                     '\\Subsubsublemma*{' .. removesortid( k ) .. '}' .. ssslstar[k]
               end
            end            
            local lastval = sssl[prevsubsubsublemma]
            sssl[prevsubsubsublemma] = lastval .. subsubsublemmastarcontent
            -- Empty table ssslstar
            ssslstar = {}
         end
         newkeys = sortLemma( sssl )
         for _, k in ipairs( newkeys ) do
            subsubsublemmacontent = subsubsublemmacontent .. 
               '\\Subsubsublemma{' .. removesortid( k ) .. '}' .. sssl[k] .. "\n"
         end
         local lastval = ssl[prevsubsublemma]
         ssl[prevsubsublemma] = lastval .. subsubsublemmacontent .. "\n\\end{Subsubsublemmata}"
         is_insubsubsublemmata = false
      elseif string.match( str, "^%s*\\end{Subsublemmata}" ) then
         if next( sslstar ) ~= nil then
            subsublemmastarcontent = ''
            local lastval = ssl[prevsubsublemma]
            sslstar[prevsubsublemma] = lastval
            ssl[prevsubsublemma] = nil
            newkeys = sortLemma( sslstar )
            local firstentry = true
            for _, k in ipairs( newkeys ) do
               if firstentry == true then
                  ssl[k] = sslstar[k]  
                  firstentry = false
                  prevsubsublemma = k
               else
                  subsublemmastarcontent = subsublemmastarcontent .. "\n" .. 
                     '\\Subsublemma*{' .. removesortid( k ) .. '}' .. sslstar[k]
               end
            end            
            local lastval = ssl[prevsubsublemma]
            ssl[prevsubsublemma] = lastval .. subsublemmastarcontent
            -- Empty table slstar
            sslstar = {}
         end
         newkeys = sortLemma( ssl )
         for _, k in ipairs( newkeys ) do
            subsublemmacontent = subsublemmacontent .. 
               '\\Subsublemma{' .. removesortid( k ) .. '}' .. ssl[k] .. "\n"
         end
         local lastval = sl[prevsublemma]
         sl[prevsublemma] = lastval .. subsublemmacontent .. "\\end{Subsublemmata}"
         is_insubsublemmata = false
      elseif string.match( str, "^%s*\\end{Sublemmata}" ) then
         --texio.write_nl("End sublemmata")
         --[[
            check whether last entry was a sublemma*. 
            Then we have to add slstar to the latest sublemma first
         ]]
         if next( slstar ) ~= nil then
            -- There are \Sublemma* to sort
            sublemmastarcontent = ''
            -- Add sublemma to table of sublemma* for sorting
            local lastval = sl[prevsublemma]
            slstar[prevsublemma] = lastval
            -- Remove it from sublemma table
            sl[prevsublemma] = nil
            -- sort slstar
            newkeys = sortLemma( slstar )
            -- use the keys to retrieve the values in the sorted order
            -- we write the sorted content to the top level structure
            local firstentry = true
            for _, k in ipairs( newkeys ) do
            -- Put the first element back in sublemma table
               if firstentry == true then
                  sl[k] = slstar[k]  
                  firstentry = false
                  prevsublemma = k
                  -- All other elements are handeled as sublemma*
               else
                  sublemmastarcontent = sublemmastarcontent .. "\n" .. 
                     '\\Sublemma*{' .. removesortid( k ) .. '}' .. slstar[k]
               end
            end
            -- put it into table with key of last \Sublemma
            local lastval = sl[prevsublemma]
            sl[prevsublemma] = lastval .. sublemmastarcontent
            -- Empty table slstar
            slstar = {}
         end
         -- now sort sublemma entries in sl table
         newkeys = sortLemma( sl )
         -- use the keys to retrieve the values in the sorted order
         -- we write the sorted content to the top level structure
         for _, k in ipairs( newkeys ) do
            sublemmacontent = sublemmacontent ..  
               '\\Sublemma{' .. removesortid( k ) .. '}' .. sl[k] .. "\n"
         end
         lemmacontent = lemmacontent .. sublemmacontent .. "\\end{Sublemmata}"
         is_insublemmata = false
      elseif string.match( str, "^%s*\\end{Dictionary}" ) then
         -- we reached the end of the dictionary
         -- write last lemma to file
         if prevlemma and prevlemma ~= '' then
            result[prevlemma] = lemmacontent
         end
         -- start sorting process
         newkeys = sortLemma( result )
         -- use the keys to retrieve the values in the sorted order
         for _, k in ipairs( newkeys ) do
            f:write( '\n\\Lemma{' .. removesortid( k ) .. '}' .. result[k] )
            -- get the first letter of the lemma
            local first = ustring.sub( removesortid( k ), 1, 1 )
            --texio.write_nl(first)
            -- check whether the letter is already known and not -
            if not hash[first] and first ~= "-" then
               res[#res+1] = first 
               hash[first] = true
            end
         end
         -- if lines follow they should be processed as well
         f:write( '\n\\end{ModDictionary}', "\n" )
         local sequenceofletters = ""
         for k, v in pairs( res ) do
            if sequenceofletters == "" then
               sequenceofletters = v
            else
               sequenceofletters = sequenceofletters .. ", " .. v
            end
         end
         tex.sprint( [[\makeatletter\immediate\write\@mainaux{\string\ifltxcounter{numberofglossaries}
         {}{\string\newcounter{numberofglossaries}}\string\stepcounter{numberofglossaries}}\makeatother]] )
         tex.sprint( [[\makeatletter\write\@mainaux{\string\csxdef{@sequenceofletters\arabic{numberofglossaries}}{]],sequenceofletters,"}}",[[\makeatother]] )
         is_indictionary = false
      else -- lines in-between environments
         if is_indictionary == false then
         else
            if is_insubsubsublemmata == true then
               subsubsublemma, subsubsublemmatext = 
                  string.match( str, "^%s*\\Subsubsublemma%*(%b{})(.*)$" )--$
               is_subsubsublemmastar = true
               if not subsubsublemma or subsubsublemma == '' then
                  -- we check for unstarred version
                  subsubsublemma, subsubsublemmatext = 
                     string.match( str, "^%s*\\Subsubsublemma(%b{})(.*)$" )--$
                  is_subsubsublemmastar = false
               end   
               if subsubsublemma and subsubsublemma ~= '' then
                  -- we found a new subsubsublemma
                  subsubsublemma = string.match( subsubsublemma, "{(.*)}" )
                  if is_subsubsublemmastar == true then
                     -- \Subsubsublemma* found -> put it into table
                     ssslstar[subsubsublemma] = subsubsublemmatext
                     -- store for potential additional text lines
                     prevsubsubsublemmastar = subsubsublemma
                  else   
                     if next( ssslstar ) ~= nil then
                        -- There are \Subsubsublemma* to sort
                        subsubsublemmastarcontent = ''
                        local lastval = sssl[prevsubsubsublemma]
                        texio.write_nl("Vorgänger: " .. prevsubsubsublemma .. " mit Wert " .. lastval)
                        ssslstar[prevsubsubsublemma] = lastval
                        sssl[prevsubsubsublemma] = nil
                        newkeys = sortLemma( ssslstar )
                        local firstentry = true
                        for _, k in ipairs( newkeys ) do
                           if firstentry == true then
                              sssl[k] = ssslstar[k]  
                              firstentry = false
                              prevsubsubsublemma = k
                           else
                              subsubsublemmastarcontent = subsubsublemmastarcontent .. "\n" .. 
                                 '\\Subsubsublemma*{' .. removesortid( k ) .. '}' .. ssslstar[k]
                           end
                        end            
                        -- put it into table with key of last \Sublemma
                        local lastval = sssl[prevsubsubsublemma]
                        sssl[prevsubsubsublemma] = lastval .. subsubsublemmastarcontent
                        -- Empty table slstar
                        ssslstar = {}
                     end
                     -- add sublemma to table and save it for possible sublemma*
                     sssl[subsubsublemma] = subsubsublemmatext
                     prevsubsubsublemma = subsubsublemma
                  end
               else                  
                  if next( ssslstar ) ~= nil then
                     local lastval = ssslstar[prevsubsubsublemmastar]
                     ssslstar[prevsubsubsublemmastar] = lastval .. "\n" .. str
                  else
                     local lastval = sssl[prevsubsubsublemma]
                     ssl[prevsubsubsublemma] = lastval .. "\n" .. str
                  end
               end  
            elseif is_insubsublemmata == true then
               subsublemma, subsublemmatext = 
                  string.match( str, "^%s*\\Subsublemma%*(%b{})(.*)$" )--$
               is_subsublemmastar = true
               if not subsublemma or subsublemma == '' then
                  -- we check for unstarred version
                  subsublemma, subsublemmatext = 
                     string.match( str, "^%s*\\Subsublemma(%b{})(.*)$" )--$
                  is_subsublemmastar = false
               end
               if subsublemma and subsublemma ~= '' then
                  -- we found a new sublemma
                  subsublemma = string.match( subsublemma, "{(.*)}" )
                  if is_subsublemmastar == true then
                     -- \Sublemma* found -> put it into table
                     sslstar[subsublemma] = subsublemmatext
                     -- store for potential additional text lines
                     prevsubsublemmastar = subsublemma
                  else   
                     if next( sslstar ) ~= nil then
                        -- There are \Subsublemma* to sort
                        subsublemmastarcontent = ''
                        local lastval = ssl[prevsubsublemma]
                        sslstar[prevsubsublemma] = lastval
                        ssl[prevsubsublemma] = nil
                        newkeys = sortLemma( sslstar )
                        local firstentry = true
                        for _, k in ipairs( newkeys ) do
                           if firstentry == true then
                              ssl[k] = sslstar[k]  
                              firstentry = false
                              prevsubsublemma = k
                           else
                              subsublemmastarcontent = subsublemmastarcontent .. "\n" .. 
                                 '\\Subsublemma*{' .. removesortid( k ) .. '}' .. sslstar[k]
                           end
                        end            
                        -- put it into table with key of last \Sublemma
                        local lastval = ssl[prevsubsublemma]
                        ssl[prevsubsublemma] = lastval .. subsublemmastarcontent
                        -- Empty table slstar
                        sslstar = {}
                     end
                     -- add sublemma to table and save it for possible sublemma*
                     ssl[subsublemma] = subsublemmatext
                     prevsubsublemma = subsublemma
                  end
               else                  
                  if next( sslstar ) ~= nil then
                     local lastval = sslstar[prevsubsublemmastar]
                     sslstar[prevsubsublemmastar] = lastval .. "\n" .. str
                  else
                     local lastval = ssl[prevsubsublemma]
                     ssl[prevsubsublemma] = lastval .. "\n" .. str
                  end
               end                        
            elseif is_insublemmata == true then
               --[[ 
                  Within Sublemmata there can be two macros: 
                  \Sublemma and \Sublemma*
                  We check for one of them, otherwise we add the text to the
                  current string
               ]]
               -- We check for \Sublemma* first
               sublemma, sublemmatext = 
                  string.match( str, "^%s*\\Sublemma%*(%b{})(.*)$" )--$
               is_sublemmastar = true
               -- If we haven't found anything yet, we look for \Sublemma
               if not sublemma or sublemma == '' then
                  sublemma, sublemmatext = 
                     string.match( str, "^%s*\\Sublemma(%b{})(.*)$" )--$
                  is_sublemmastar = false
               end
               --[[
                  If we have found something we know from the boolean variable
                  is_sublemmastar
               ]]
               if sublemma and sublemma ~= '' then
                  -- we found a new sublemma or a sublemma*
                  -- Rip off braces before continuing
                  sublemma = string.match( sublemma, "{(.*)}" )
                  --texio.write_nl( "Found new sublemma: " .. sublemma )
                  -- We now distinguish
                  if is_sublemmastar == true then
                     -- \Sublemma* found -> put it into table
                     slstar[sublemma] = sublemmatext
                     -- store for potential additional text lines
                     prevsublemmastar = sublemma
                  else   
                     -- \Sublemma found -> sort \Sublemma* (if any), then proceed
                     if next( slstar ) ~= nil then
                        -- There are \Sublemma* to sort
                        sublemmastarcontent = ''
                        -- Add sublemma to table of sublemma* for sorting
                        local lastval = sl[prevsublemma]
                        slstar[prevsublemma] = lastval
                        -- Remove it from sublemma table
                        sl[prevsublemma] = nil
                        -- sort slstar
                        newkeys = sortLemma( slstar )
                        -- use the keys to retrieve the values in the sorted order
                        -- we write the sorted content to the top level structure
                        local firstentry = true
                        for _, k in ipairs( newkeys ) do
                           -- Put the first element back in sublemma table
                           if firstentry == true then
                               sl[k] = slstar[k]  
                               firstentry = false
                               prevsublemma = k
                           -- All other elements are handeled as sublemma*
                           else 
                              sublemmastarcontent = sublemmastarcontent .. "\n" .. 
                                 '\\Sublemma*{' .. removesortid( k ) .. '}' .. 
                                 slstar[k]
                           end
                        end
                        -- put it into table with key of last \Sublemma
                        local lastval = sl[prevsublemma]
                        sl[prevsublemma] = lastval .. sublemmastarcontent
                        -- Empty table slstar
                        slstar = {}
                     end
                     -- add sublemma to table and save it for possible sublemma*
                     sl[sublemma] = sublemmatext
                     prevsublemma = sublemma
                  end
               else
                  --[[ 
                     we concatenate the string to the last 
                     sublemma or sublemma* in the table
                  --]]
                  if next( slstar ) ~= nil then
                     local lastval = slstar[prevsublemmastar]
                     slstar[prevsublemmastar] = lastval .. "\n" .. str
                  else
                     local lastval = sl[prevsublemma]
                     sl[prevsublemma] = lastval .. "\n" .. str
                  end
               end
            else -- it can only be a lemma entry, but which one
               --texio.write_nl("Check line within dictionary")
               lemma_oarg, lemma, text = string.match( str, "^%s*\\Lemma%[(.-)%](%b{})(.*)$" ) --$
               if not lemma_oarg or lemma_oarg == '' then
                  lemma, text = string.match( str, "^%s*\\Lemma(%b{})(.*)$" ) --$
               else
                  text = "\\Lemmaoarg{" .. lemma_oarg .. "}" .. text                 
               end
               if lemma and lemma ~= '' then
                  lemma = string.match( lemma, "{(.*)}" )
                  -- texio.write_nl("Found new lemma " .. lemma)            
               -- we found a new lemma
               -- write previous lemma (if any) to table
                  if prevlemma and prevlemma ~= '' then
                     lemmacontent = string.gsub( lemmacontent, '\n\n', '\n' )
                     result[prevlemma] = lemmacontent
                  end
               -- remember new lemma as prevlemma for next entry
                  prevlemma = lemma
                  lemmacontent = text
               -- delete old entries for sublemma
                  prevsublemma = ''
                  sublemmacontent = '' 
               else
                  lemmacontent = lemmacontent .. "\n" .. str
               end
            end
         end
      end
   end
   elseif glosslang == "Av" or
          glosslang == "MP" or
          glosslang == "NP" or
          glosslang == "Skt" then
   for k,v in pairs( lines ) do
   -- get line k and process it
      local str = lines[k]
   
      if string.match( str, "^%s*\\begin{Dictionary}" ) then
         f:write( '\\begin{ModDictionary}', "\n" )
         is_indictionary = true
      elseif string.match( str, "^%s*\\end{Dictionary}" ) then
         -- we reached the end of the dictionary
         -- write last lemma to file
         if prevlemma and prevlemma ~= '' then
            result[prevlemma] = lemmacontent
         end
         -- start sorting process
         newkeys = sortLemma( result )
         -- use the keys to retrieve the values in the sorted order
         for _, k in ipairs( newkeys ) do
            f:write( '\n\\Lemma{' .. removesortid( k ) .. '}' .. result[k] )
            -- get the first letter of the lemma
            local first = ustring.sub( removesortid( k ), 1, 1 )
            --texio.write_nl(first)
            -- check whether the letter is already known and not -
            if not hash[first] and first ~= "-" then
               res[#res+1] = first 
               hash[first] = true
            end
         end
         -- if lines follow they should be processed as well
         f:write( '\n\\end{ModDictionary}', "\n" )
         local sequenceofletters = ""
         for k,v in pairs( res ) do
            if sequenceofletters == "" then
               sequenceofletters = v
            else
               sequenceofletters = sequenceofletters .. ", " .. v
            end
         end
         tex.sprint( [[\makeatletter\immediate\write\@mainaux{\string\ifltxcounter{numberofglossaries}
         {}{\string\newcounter{numberofglossaries}}\string\stepcounter{numberofglossaries}}\makeatother]])
         tex.sprint([[\makeatletter\write\@mainaux{\string\csxdef{@sequenceofletters\arabic{numberofglossaries}}{]],sequenceofletters,"}}",[[\makeatother]] )
         is_indictionary = false
      else
         if is_indictionary == false then
         else -- it can only be a lemma entry, but which one
            --texio.write_nl("Check line within dictionary")
            lemma_oarg, lemma, text = string.match( str, "^%s*\\Lemma%[(.-)%](%b{})(.*)$" ) --$
            if not lemma_oarg or lemma_oarg == '' then
               lemma, text = string.match( str, "^%s*\\Lemma(%b{})(.*)$" ) --$
            else
               text = "\\Lemmaoarg{" .. lemma_oarg .. "}" .. text                 
            end
            if lemma and lemma ~= '' then
               lemma = string.match( lemma, "{(.*)}" )
               --texio.write_nl("Found new lemma " .. lemma)            
               -- we found a new lemma
               -- write previous lemma (if any) to table
               if prevlemma and prevlemma ~= '' then
                  lemmacontent = string.gsub( lemmacontent, '\n\n', '\n' )
                  result[prevlemma] = lemmacontent
               end
               -- remember new lemma as prevlemma for next entry
               prevlemma = lemma
               lemmacontent = text
            else
               lemmacontent = lemmacontent .. "\n" .. str
            end
         end
      end
   end
   else
      texio.write_nl( "Could not find a sort method for " .. glosslang )
   end
   f:close()
end

-- We remove the sortid after the comparison
function removesortid( s )
   local snew = s
   snew = string.gsub( snew, '^¹(.+)$', '%1' )
   snew = string.gsub( snew, '^²(.+)$', '%1' )
   snew = string.gsub( snew, '^³(.+)$', '%1' )
   return snew
end

function removespecialchars( s )
   local snew = s
   -- We replace/remove some characters not to be considered for sorting
   --snew = string.gsub(snew, '^%-?(.+)%-?$', '%1')--$
   --texio.write_nl("Vorher: " .. snew)
   snew = string.gsub( snew, '%-', '' )
   snew = string.gsub( snew, '%.', '' )
   snew = string.gsub( snew, '%(', '' )
   snew = string.gsub( snew, '%)', '' )
   snew = string.gsub( snew, '°', '' )
   snew = string.gsub( snew, '⁺', '' )
   snew = string.gsub( snew, '%s-/%s-', ' ' )
   snew = string.gsub( snew, '%s-…%s-', ' ' )
   -- ... and we move sort ids to the very end
   snew = string.gsub( snew, '^¹(.+)$', '%11' )
   snew = string.gsub( snew, '^²(.+)$', '%12' )
   snew = string.gsub( snew, '^³(.+)$', '%13' )
   -- we change special chars to match Unicode characters
   --   s1 = ustring.gsub(s1, 'é', 'é')
   snew = ustring.gsub( snew, 'ḍ', 'ḍ' )
   --   s1 = ustring.gsub(s1, 'ḳ', 'ḳ')
   snew = ustring.gsub( snew, 'ḷ', 'ḷ' )   
   snew = ustring.gsub( snew, 'ṃ', 'ṃ' )      
   snew = ustring.gsub( snew, 'ṇ', 'ṇ' )
   --   s1 = ustring.gsub(s1, 'ọ', 'ọ')
   snew = ustring.gsub( snew, 'ś', 'ś' )
   snew = ustring.gsub( snew, 'š' ,'š' )
   snew = ustring.gsub( snew, 'ṣ', 'ṣ' )
   snew = ustring.gsub( snew, 'ṭ', 'ṭ' )
   snew = string.gsub( snew, '\\XVE ', 'xv' )
   snew = string.gsub( snew, '\\NGVE' , 'ŋv' )
   snew = string.gsub( snew, '\\aee ', 'ǝ̄' )
   snew = string.gsub( snew, '\\XVE{}', 'xv' )
   snew = string.gsub( snew, '\\NGVE{}', 'ŋv' )
   snew = string.gsub( snew, '\\aee{}', 'ǝ̄' )
   snew = string.gsub( snew, '\\uncertain{([^}]+)}', '%1' )
   --texio.write_nl("Nachher: " .. snew)
   return snew
end

function sortLemma( t )
   local tkeys = {}
   -- populate the table that holds the keys
   for k in pairs( t ) do table.insert( tkeys, k ) end
   -- sort the keys
   table.sort( tkeys, compare )
   return tkeys
end

function compare( a, b )
   -- before sorting, we remove dashes from the beginning and from the end ...
   local s1 = removespecialchars( a )
   local s2 = removespecialchars( b )
      
   -- the comparison returns a sort order so1 and so2
   local so1, so2
   
   --texio.write_nl('Compare ' .. s1 .. ' with ' .. s2)
   -- if both strings are equal we stop processing
   if s1 ~= s2 then
   -- as long as both strings have equal characters (and are both not empty)
   -- get the next sorting letter and compare them
      while s1 ~= '' and s2 ~= '' do
         --texio.write_nl('Vorher: ' .. s1 .. ' ' .. s2)
         so1, s1 = sortletter(s1)
         so2, s2 = sortletter(s2)
         --texio.write_nl('Sort order: ' .. so1 .. ' ' .. so2)
         --texio.write_nl('Rest: ' .. s1 .. ' ' .. s2)
         if so1 < so2 then
            return true
         elseif so1 > so2 then
            return false
         end
         --texio.write_nl('Nachher: ' .. s1 .. ' ' .. s2)
      end
      if s1 == '' then
         return true
      else
         return false
      end
   else
      return false
   end
end

function sortletter(s)
   local sortorder
   if glosslang == 'Guj' then -- Gujarati
      sortorder = {["a"] = 11, ["ā"] = 12, ["i"] = 13, ["ī"] = 14,["u"] = 15,
      ["ū"] = 16, ["r̥"] = 17, ["e"] = 18, ["o"] = 19, ["ṃ"] = 20, ["k"] = 21, 
      ["kh"] = 22, ["g"] = 23, ["gh"] = 24, ["ṅ"] = 25, ["c"] = 26, ["ch"] = 27,
      ["j"] = 28, ["jh"] = 29, ["z"] = 30, ["ñ"] = 31, ["ṭ"] = 32, ["ṭh"] = 33,
      ["ḍ"] = 34, ["ḍh"] = 35, ["ṇ"] = 36, ["t"] = 37, ["th"] = 38, ["d"] = 39, 
      ["dh"] = 40, ["n"] = 41, ["p"] = 42, ["ph"] = 43, ["f"] = 44, ["b"] = 45,
      ["bh"] = 46, ["m"] = 47, ["y"] = 48, ["r"] = 49, ["l"] = 50, ["v"] = 51,
      ["ś"] = 52, ["ṣ"] = 53, ["s"] = 54, ["h"] = 55, ["ḷ"] = 56, ["1"] = 1, 
      ["2"] = 2, ["3"] = 3, [" "] = 60}   
   elseif glosslang == 'MP' then -- Middle Persian (Pahlavi)  
      sortorder = {["a"] = 11, ["ā"] = 12, ["b"] = 13, ["c"] = 14, ["d"] = 15,
      ["e"] = 16, ["ē"] = 17, ["f"] = 18, ["g"] = 19, ["γ"] = 20, ["h"] = 21,
      ["i"] = 22, ["ī"] = 23, ["j"] = 24, ["k"] = 25, ["l"] = 26, ["m"] = 27,
      ["n"] = 28, ["o"] = 29, ["ō"] = 30, ["p"] = 31, ["r"] = 32, ["s"] = 33,
      ["š"] = 34, ["t"] = 35, ["u"] = 36, ["ū"] = 37, ["w"] = 38, ["x"] = 39,
      ["y"] = 40, ["z"] = 41, ["ž"] = 42, ["1"] = 1, ["2"] = 2, ["3"] = 3,
      [" "] = 50}
   elseif glosslang == 'NP' then -- New Persian
      sortorder = {["a"] = 11, ["ā"] = 12, ["e"] = 13, ["o"] = 14, ["u"] = 15,
      ["i"] = 16, ["b"] = 17, ["p"] = 18, ["t"] = 19, ["s̱"] = 20, ["j"] = 21,
      ["č"] = 22, ["ḥ"] = 23, ["x"] = 24, ["d"] = 25, ["ẕ"] = 26, ["r"] = 27,
      ["z"] = 28, ["ž"] = 29, ["s"] = 30, ["š"] = 31, ["ṣ"] = 32, ["ż"] = 33,
      ["ṭ"] = 34, ["ẓ"] = 35, ["ʿ"] = 36, ["ġ"] = 37, ["f"] = 38, ["q"] = 39,
      ["k"] = 40, ["g"] = 41, ["l"] = 42, ["m"] = 43, ["n"] = 44, ["w"] = 45,
      ["h"] = 46, ["y"] = 47, ["1"] = 2, ["2"] = 2, ["3"] = 3, [" "] = 50}
   elseif glosslang == 'Av' then -- Avestan, standard case
      sortorder = {["a"] = 11, ["ā"] = 12, ["ā̊ "] = 13, ["ą"] = 14, ["b"] = 15,
      ["β"] = 16, ["c"] = 17, ["d"] = 18, ["δ"] = 19, ["e"] = 20, ["ē"] = 21, 
      ["ǝ"] = 22, ["ǝ̄"] = 23, -- U+01DD 
      ["ə"] = 22, ["ə̄"] = 23, -- U+0259
      ["f"] = 24, ["g"] = 25, ["γ"] = 26, ["h"] = 27,
      ["i"] = 28, ["ī"] = 29, ["j"] = 30, ["k"] = 31, ["m"] = 32, ["n"] = 33,
      ["ń"] = 34, ["ṇ"] = 35, ["ŋ"] = 36, ["ŋ́"] = 37, ["ŋv"] = 38, ["o"] = 39,
      ["ō"] = 40, ["p"] = 41, ["r"] = 42, ["s"] = 43, ["š"] = 44,
      ["š́ "] = 45, ["ṣ̌"] = 46, ["t"] = 47, ["t̰"] = 48, ["ϑ"] = 49, ["θ"] = 49,
      ["u"] = 50, ["ū"] = 51,
      ["v"] = 52, ["x"] = 53, ["x́"] = 54, ["xv"] = 55, ["y"] = 56, ["z"] = 57,
      ["ž"] = 58, ["1"] = 1, ["2"] = 2, ["3"] = 3, [" "] = 60}      
   elseif glosslang == 'Skt' then -- Sanskrit
      sortorder = {["a"] = 11, ["ā"] = 12, ["i"] = 13, ["ī"] = 14, ["u"] = 15,
      ["ū"] = 16, ["r̥"] = 17, ["r̥̄"] = 18, ["e"] = 19, ["ai"] = 20, ["o"] = 21, 
      ["au"] = 22, ["ṃ"] = 23, ["ḥ"] = 24, ["k"] = 25, ["kh"] = 26, ["g"] = 27,
      ["gh"] = 28, ["ṅ"] = 29, ["c"] = 30, ["ch"] = 31, ["j"] = 32, ["jh"] = 33,
      ["ñ"] = 34, ["ṭ"] = 35, ["ṭh"] = 36, ["ḍ"] = 37, ["ḍh"] = 38, ["ṇ"] = 39,
      ["t"] = 40, ["th"] = 41, ["d"] = 42, ["dh"] = 43, ["n"] = 44,
      ["p"] = 45, ["ph"] = 46, ["b"] = 47, ["bh"] = 48, ["m"] = 49,
      ["y"] = 50, ["r"] = 51,
      ["l"] = 52, ["v"] = 53, ["ś"] = 54, ["ṣ"] = 55, ["s"] = 56, ["h"] = 57,
      ["1"] = 1, ["2"] = 2, ["3"] = 3, [" "] = 60}      
   else 
      texio.write_nl( "Unknown language for glossary sorting" )
   end
   local sortletter = ''
   
   -- If s is at last two characters long, we check, whether the first two 
   -- characters form a valid sorting letter (according to our scheme)
   if ustring.len( s ) > 1 then
      sortletter = ustring.sub( s, 1, 2 )
      if sortorder[sortletter] == nil then
         sortletter = ustring.sub( s, 1, 1 )
      end
   else -- otherwise just take the first character and check
      sortletter = ustring.sub( s, 1, 1 )   
   end
   --texio.write_nl(s .. ' ' .. sortletter .. ' ' .. ustring.len(sortletter))
   if sortorder[sortletter] then
      return sortorder[sortletter], ustring.sub( s, ustring.len( sortletter ) + 1 )
   else -- if there is a letter we don't know, insert at the very end
      texio.write_nl( "Unknown letter " .. sortletter )
      return 99, ustring.sub( s, ustring.len(sortletter) + 1 )
   end
end

-- taken from https://gist.github.com/phi-gamma/2622252

--[[ 
https://tex.stackexchange.com/questions/374064/upright-punctuation-independent-from-font-style
This is a function to get specific punctuation characters upright even if they 
are in an italics environment
--]]
function table.contains(t, k)
    for _, v in pairs(t) do
        if v == k then
            return true
        end
    end
    return false
end

function upright_punctuation(head)
    -- Traverse vertical list
    for line in node.traverse_id(node.id("hhead"),head) do
       -- Traverse horizontal list
       for glyph in node.traverse_id(node.id("glyph"), line.head) do
           -- Check if the glyph is
           --                   (   )   ,   :   ;
           if (table.contains({ 40, 41, 44, 58, 59 }, glyph.char)) then
               -- and change its font to upright.
               -- (this is not so generic, 15 just happens to be upright)
               glyph.font = 15
           end
       end
    end
    return head
end

function read_stanzas_from_file(f, suffix)
   if not file_exists( f ) then return {} end   
   local outfile = 'stanzas.tex'
   local lines = lines_from( f )
   local stanzanr = ''
   local stanzastart = ''
   local stanzaend = ''
   local text = ''
   local book = ''
   local buf = {}
   
   for k,v in pairs( lines ) do
      -- get line k and process it
      local str = lines[k]
      --texio.write_nl(str .. "\n")
      if isempty( str ) then 
         buf[k] = ''
      else
         -- Check, whether a new stanza starts
         if string.match( str, "^\\begin{stanza}{.-}" ) then
            book, stanzanr, text = string.match( str, "^\\begin{stanza}{\\(.-){(.-)}}" )
            buf[k] = "\\csgdef{stanza-" .. book .. stanzanr .. suffix .. "}{%\n" .. str .. "%%\n"
         elseif string.match( str, "^.-\\end{stanza}\\begin{stanza}{.-}.-$" ) then
            stanzaend, book, stanzanr, stanzastart = string.match(str, "^(.-)\\end{stanza}\\begin{stanza}{\\(.-){(.-)}}(.-)$")
            buf[k] = stanzaend .. "\n\\end{stanza}}%\n\\csgdef{stanza-" .. 
               book .. stanzanr .. suffix .. "}{%\n\\begin{stanza}{\\" .. book .. "{" .. stanzanr .. "}}%\n" .. stanzastart .. "\n"
         elseif string.match( str, "^.-\\newline\\end{stanza}$" ) then
            text, rest = string.match( str, "^(.-)(\\newline\\end{stanza})$" )
            buf[k] = text .. "\\lastnewline\\end{stanza}}%\n"
         elseif string.match( str, "^.-\\end{stanza}$" ) then
            buf[k] = str .. "}\n"
         else
            buf[k] = str .. "\n"
         end
      end
   end
   local final_string = table.concat( buf )
   local g = assert( io.open( outfile, "a" ))
   g:write( final_string )
   g:close()
end

function create_stanzafile()
   local file = assert( io.open( "./stanzas.tex", "w" ))
   file:close()
end

function strtocs( s )
   local book, number = ''
   book, number = string.match( s, "^(%u+)(.+)$" )
   tex.sprint( "\\" .. book .. "{" .. number .. "}" )
end

function read_transcriptions( f )
   if not file_exists( f ) then return {} end 
   local lines = lines_from( f )
   local outfile = 'transcriptions-mod.tex'
   local sec, thrd = ''
   local newstr = ''
   local buf = {}
   local c = 0
   -- Get third argument of \Newtranscription
   for k, v in pairs( lines ) do
      -- get line k and process it
      local str = lines[k]
      -- get second and third argument
      sec, thrd = string.match( str, "^\\Newtranscription{(.-)}{(.-)}" )
      newstr = ''
      if not isempty( sec ) then -- ignore empty lines
         c = 0
         for i in string.gmatch( thrd, "%S+" ) do
            c = c + 1
            newstr = newstr .. "\\csgdef{" .. sec .. "-trans-" .. c .. "}{" .. i .. "}\n"
         end
      end
      buf[k] = newstr
   end
   local final_string = table.concat( buf )
   local g = assert( io.open( outfile, "w" ))
   g:write( final_string )
   g:close()
end

function isempty( s )
   return s == nil or s == ''
end