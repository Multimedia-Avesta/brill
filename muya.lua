-- 2020/05/02 v0.32.1
local ustring = require( 'ustring' )

function modifySorting()
   local f = io.open("passages.idx", "r")
   local g = io.open("passages-mod.idx", "w+")
   local content = f:read("*all")
   f:seek('set')
   -- first look for books with %d.%d
   content = string.gsub(content, 
      "\\gls%s*{([^}]*)}\\nobreak%s*\\hspace%s*{\\fontdimen 2\\font%s*}(%d+)%.(%d+)",
      function(a,b,c) return string.format(
         "%s%03d.%03d@%s\\nobreak\\hspace{\\fontdimen 2\\font}%d.%d", a, b, c, a, b, c) end)
   -- look for books with %d
   content = string.gsub(content, 
      "\\gls%s*{([^}]*)}\\nobreak%s*\\hspace%s*{\\fontdimen 2\\font%s*}(%d+)",
      function(a,b) return string.format(
         "%s%03d@%s\\nobreak\\hspace{\\fontdimen 2\\font}%d", a, b, a, b) end)
   g:write(content)
   f:close()
   g:close()
end

-- see if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

function sortGlossary()
   -- tests the functions above
   local file = status.filename
   local outfile = 'dictionaryconv.tex'
   
   if not file_exists(file) then return {} end
   
   local lines = lines_from(file)
   local text = ""
   local sublemmatext = ""      
   local subsublemmatext = ""      
   local subsubsublemmatext = ""      
   local str = ""
   local prevlemma = ""
   local prevsublemma = ""
   local prevsubsublemma = ""   
   local prevsubsubsublemma = ""   
   local lemma = ""
   local sublemma = ""
   local subsublemma = ""
   local subsubsublemma = ""   
   local lemmacontent = ""
   local sublemmacontent = ""      
   local subsublemmacontent = ""      
   local subsubsublemmacontent = ""         
   local result = {}
   local sl = {}
   local ssl = {}
   local sssl = {}
   local newkeys = {}
   local inDictionary = false
   local inSublemmata = false
   local inSubsublemmata = false
   local inSubsubsublemmata = false   
   local f = assert(io.open(outfile, "w+"))
   local hash = {}
   local res = {}
   
   for k,v in pairs(lines) do
      -- get line k and process it
      local str = lines[k]
      
      if string.match(str, "^%s*\\begin{Dictionary}") then
         f:write('\\begin{ModDictionary}', "\n")
         inDictionary = true
      elseif string.match(str, "^%s*\\begin{Sublemmata}") then
         inSublemmata = true
         -- Write line to top-level structure
         lemmacontent = lemmacontent .. "\n\\begin{Sublemmata}"
         -- define an empty table for sublemmata environment
         sl = {}
      elseif string.match(str, "^%s*\\begin{Subsublemmata}") then
         inSubsublemmata = true
         -- Write line to top-level structure
         sublemmacontent = sublemmacontent .. "\n\\begin{Subsublemmata}"
         -- define an empty table for sublemmata environment
         ssl = {}
      elseif string.match(str, "^%s*\\begin{Subsubsublemmata}") then
         inSubsubsublemmata = true
         -- Write line to top-level structure
         subsublemmacontent = subsublemmacontent .. 
         "\n\\begin{Subsubsublemmata}"
         -- define an empty table for sublemmata environment
         sssl = {}
      elseif string.match(str, "^%s*\\end{Subsubsublemmata}") then
         if prevsubsubsublemma and prevsubsubsublemma ~= '' then
            sssl[prevsubsubsublemma] = subsubsublemmacontent
         end
         newkeys = sortLemma(sssl)
         -- use the keys to retrieve the values in the sorted order
         -- we write the sorted content to the top level structure
         for _, k in ipairs(newkeys) do
            subsublemmacontent = subsublemmacontent .. '\n' .. 
               '\\Subsubsublemma{' .. removesortid(k) .. '}' .. sssl[k]
         end
         subsublemmacontent = subsublemmacontent .. "\n\\end{Subsubsublemmata}"
         inSubsubsublemmata = false
      elseif string.match(str, "^%s*\\end{Subsublemmata}") then
         if prevsubsublemma and prevsubsublemma ~= '' then
            ssl[prevsubsublemma] = subsublemmacontent
         end
         newkeys = sortLemma(ssl)
         -- use the keys to retrieve the values in the sorted order
         -- we write the sorted content to the top level structure
         for _, k in ipairs(newkeys) do
            sublemmacontent = sublemmacontent .. '\n' .. 
               '\\Subsublemma{' .. removesortid(k) .. '}' .. ssl[k]
         end
         sublemmacontent = sublemmacontent .. "\n\\end{Subsublemmata}"
         inSubsublemmata = false
      elseif string.match(str, "^%s*\\end{Sublemmata}") then
         --texio.write_nl("End sublemmata")
         if prevsublemma and prevsublemma ~= '' then
            sl[prevsublemma] = sublemmacontent
         end
         newkeys = sortLemma(sl)
         -- use the keys to retrieve the values in the sorted order
         -- we write the sorted content to the top level structure
         for _, k in ipairs(newkeys) do
            lemmacontent = lemmacontent .. '\n' .. 
               '\\Sublemma{' .. removesortid(k) .. '}' .. sl[k]
         end
         lemmacontent = lemmacontent .. "\n\\end{Sublemmata}"
         inSublemmata = false
      elseif string.match(str, "^%s*\\end{Dictionary}") then
         -- we reached the end of the dictionary
         -- write last lemma to file
         if prevlemma and prevlemma ~= '' then
            result[prevlemma] = lemmacontent
         end
         -- start sorting process
         newkeys = sortLemma(result)
         -- use the keys to retrieve the values in the sorted order
         for _, k in ipairs(newkeys) do
            f:write('\n\\Lemma{' .. removesortid(k) .. '}' .. result[k])
            -- get the first letter of the lemma
            local first = ustring.sub(removesortid(k),1,1)
            --texio.write_nl(first)
            -- check whether the letter is already known and not -
            if not hash[first] and first ~= "-" then
               res[#res+1] = first 
               hash[first] = true
            end
         end
         -- if lines follow they should be processed as well
         f:write('\n\\end{ModDictionary}', "\n")
         local sequenceofletters = ""
         for k,v in pairs(res) do
            if sequenceofletters == "" then
               sequenceofletters = v
            else
               sequenceofletters = sequenceofletters .. ", " .. v
            end
         end
         tex.sprint([[\makeatletter\immediate\write\@mainaux{\string\ifltxcounter{numberofglossaries}
         {}{\string\newcounter{numberofglossaries}}\string\stepcounter{numberofglossaries}}\makeatother]])
         tex.sprint([[\makeatletter\write\@mainaux{\string\csxdef{@sequenceofletters\arabic{numberofglossaries}}{]],sequenceofletters,"}}",[[\makeatother]])
         inDictionary = false
      else
         if inDictionary == false then
         else
            if inSubsubsublemmata == true then
               subsubsublemma, subsubsublemmatext = 
                  string.match(str, "^%s*\\Subsubsublemma{(.-)}(.*)$")--$
               if subsubsublemma and subsubsublemma ~= '' then
               -- we found a new sublemma
                  if prevsubsubsublemma and prevsubsubsublemma ~= '' then
                     sssl[prevsubsubsublemma] = subsubsublemmacontent
                  end
                  -- remember new sublemma as prevsublemma for next entry
                  prevsubsubsublemma = subsubsublemma
                  subsubsublemmacontent = subsubsublemmatext
               else
                  subsubsublemmacontent = subsubsublemmacontent .. "\n" .. str
               end                                    
            elseif inSubsublemmata == true then
               subsublemma, subsublemmatext = 
                  string.match(str, "^%s*\\Subsublemma{(.-)}(.*)$")--$
               if subsublemma and subsublemma ~= '' then
               -- we found a new sublemma
                  if prevsubsublemma and prevsubsublemma ~= '' then
                     ssl[prevsubsublemma] = subsublemmacontent
                  end
                  -- remember new sublemma as prevsublemma for next entry
                  prevsubsublemma = subsublemma
                  subsublemmacontent = subsublemmatext
                  prevsubsubsublemma = ''
                  subsubsublemmacontent = ''
               else
                  subsublemmacontent = subsublemmacontent .. "\n" .. str
               end                           
            elseif inSublemmata == true then
               sublemma, sublemmatext = 
                  string.match(str, "^%s*\\Sublemma{(.-)}(.*)$")--$
               if sublemma and sublemma ~= '' then
               -- we found a new sublemma
                  if prevsublemma and prevsublemma ~= '' then
                     sl[prevsublemma] = sublemmacontent
                  end
                  -- remember new sublemma as prevsublemma for next entry
                  prevsublemma = sublemma
                  sublemmacontent = sublemmatext
                  prevsubsublemma = ''
                  subsublemmacontent = '' 
               else
                  sublemmacontent = sublemmacontent .. "\n" .. str
               end               
            else -- it can only be a lemma entry, but which one
               --texio.write_nl("Check line within dictionary")
               lemma_oarg, lemma, text = string.match(str, "^%s*\\Lemma%[(.-)%]{(.-)}(.*)$") --$
               if not lemma_oarg or lemma_oarg == '' then
                  lemma, text = string.match(str, "^%s*\\Lemma{(.-)}(.*)$") --$
               else
                  text = "\\Lemmaoarg{" .. lemma_oarg .. "}" .. text                 
               end
               if lemma and lemma ~= '' then
   --            texio.write_nl("Found new lemma " .. lemma)            
               -- we found a new lemma
               -- write previous lemma (if any) to table
                  if prevlemma and prevlemma ~= '' then
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
   f:close()
end

function removesortid (s)
   local snew = s
   snew = string.gsub(snew, '^¹(.+)$', '%1')
   snew = string.gsub(snew, '^²(.+)$', '%1')
   snew = string.gsub(snew, '^³(.+)$', '%1')
   return snew
end

function sortLemma (t)
   local tkeys = {}
   -- populate the table that holds the keys
   for k in pairs(t) do table.insert(tkeys, k) end
   -- sort the keys
   table.sort(tkeys, compare)
   return tkeys
end

function compare (a,b)
   -- before sorting, we remove dashes at the end and we remove sort ids
   local s1 = string.gsub(a, '^-?(.+)-?$', '%1')--$
   s1 = string.gsub(s1, '^¹(.+)$', '%11')
   s1 = string.gsub(s1, '^²(.+)$', '%12')
   s1 = string.gsub(s1, '^³(.+)$', '%13')
   s1 = string.gsub(s1, '%s-…%s-', ' ')
--   s1 = ustring.gsub(s1, 'é', 'é')
   s1 = ustring.gsub(s1, 'ḍ', 'ḍ')
--   s1 = ustring.gsub(s1, 'ḳ', 'ḳ')
   s1 = ustring.gsub(s1, 'ḷ', 'ḷ')   
   s1 = ustring.gsub(s1, 'ṃ', 'ṃ')      
   s1 = ustring.gsub(s1, 'ṇ', 'ṇ')
--   s1 = ustring.gsub(s1, 'ọ', 'ọ')
   s1 = ustring.gsub(s1, 'ś', 'ś')
   s1 = ustring.gsub(s1, 'ṣ', 'ṣ')
   s1 = ustring.gsub(s1, 'ṭ', 'ṭ')
         
   local s2 = string.gsub(b, '^-?(.+)-?$', '%1')--$
   s2 = string.gsub(s2, '^¹(.+)$', '%11')
   s2 = string.gsub(s2, '^²(.+)$', '%12')
   s2 = string.gsub(s2, '^³(.+)$', '%13')   
   s2 = string.gsub(s2, '%s-…%s-', ' ')
   s2 = ustring.gsub(s2, 'ḍ', 'ḍ')
--   s2 = ustring.gsub(s2, 'é', 'é')
--   s2 = ustring.gsub(s2, 'ḳ', 'ḳ')
   s2 = ustring.gsub(s2, 'ḷ', 'ḷ')   
   s2 = ustring.gsub(s2, 'ṃ', 'ṃ')   
   s2 = ustring.gsub(s2, 'ṇ', 'ṇ')
--   s2 = ustring.gsub(s2, 'ọ', 'ọ')   
   s2 = ustring.gsub(s2, 'ś', 'ś')
   s2 = ustring.gsub(s2, 'ṣ', 'ṣ')
   s2 = ustring.gsub(s2, 'ṭ', 'ṭ')
      
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

function sortletter (s)
   local gujorder = {["a"] = 1, ["ā"] = 2, ["i"] = 3, ["ī"] = 4,["u"] = 5,
   ["ū"] = 6, ["r̥"] = 7, ["e"] = 8, ["o"] = 9, ["ṃ"] = 10, ["k"] = 11, 
   ["kh"] = 12, ["g"] = 13, ["gh"] = 14, ["ṅ"] = 15, ["c"] = 16, ["ch"] = 17,
   ["j"] = 18, ["jh"] = 19, ["z"] = 20, ["ñ"] = 21, ["ṭ"] = 22, ["ṭh"] = 23,
   ["ḍ"] = 24, ["ḍh"] = 25, ["ṇ"] = 26, ["t"] = 27, ["th"] = 28, ["d"] = 29, 
   ["dh"] = 30, ["n"] = 31, ["p"] = 32, ["ph"] = 33, ["f"] = 34, ["b"] = 35,
   ["bh"] = 36, ["m"] = 37, ["y"] = 38, ["r"] = 39, ["l"] = 40, ["v"] = 41,
   ["ś"] = 42, ["ṣ"] = 43,["s"] = 44, ["h"] = 45, ["ḷ"] = 46, ["1"] = 47, 
   ["2"] = 48, ["3"] = 49, [" "] = 50}   
   local sortletter = ''
   
   -- If s is at last two characters long, we check, whether the first two 
   -- characters form a valid sorting letter (according to our scheme)
   if ustring.len(s) > 1 then
      sortletter = ustring.sub(s,1,2)
      if gujorder[sortletter] == nil then
         sortletter = ustring.sub(s,1,1)
      end
   else -- otherwise just take the first character and check
      sortletter = ustring.sub(s,1,1)   
   end
   --texio.write_nl(s .. ' ' .. sortletter .. ' ' .. ustring.len(sortletter))
   if gujorder[sortletter] then
      return gujorder[sortletter], ustring.sub(s, ustring.len(sortletter) + 1)
   else -- if there is a letter we don't know, insert at the very end
      texio.write_nl("Unknown letter " .. sortletter)
      return 99, ustring.sub(s, ustring.len(sortletter) + 1)
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
