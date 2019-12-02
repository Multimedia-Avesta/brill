function modifySorting()
   local f = io.open("passages.idx", "r+")
   local content = f:read("*all")
   f:seek('set')
   content = string.gsub(content, "\\gls {([^}]*)}~?(%d+)%.(%d+)",
   function(a,b,c) return
      string.format("%s%03d.%03d@%s~%d.%d", a, b, c, a, b, c) end)
   f:write(content)
   f:close()
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
   local file = 'dictionary.tex'
   local outfile = 'dictionaryconv.tex'
   
   if not file_exists(file) then return {} end
   
   local lines = lines_from(file)
   local text = ""
   local sublemmatext = ""      
   local str = ""
   local prevlemma = ""
   local prevsublemma = ""
   local lemma = ""
   local sublemma = ""
   local lemmacontent = ""
   local sublemmacontent = ""      
   local result = {}
   local sl = {}
   local newkeys = {}
   local inDictionary = false
   local inSublemmata = false
   local f = assert(io.open(outfile, "w+"))
   
   for k,v in pairs(lines) do
      -- get line k and process it
      local str = lines[k]
      
      if string.match(str, "^\\begin{Dictionary}") then
         f:write('\\begin{ModDictionary}', "\n")
         inDictionary = true
      elseif string.match(str, "^\\begin{Sublemmata}") then
         inSublemmata = true
         sl = {}
         --strSubLemmata = ''
         lemmacontent = lemmacontent .. "\n\\begin{SubLemmata}"
      elseif string.match(str, "^\\end{Sublemmata}") then
         if prevsublemma and prevsublemma ~= '' then
            sl[prevsublemma] = sublemmacontent
         end
         newkeys = sortLemma(sl)
         -- use the keys to retrieve the values in the sorted order
         for _, k in ipairs(newkeys) do
            lemmacontent = lemmacontent .. "\n" .. sl[k]               
         end
         lemmacontent = lemmacontent .. "\n\\end{Sublemmata}"
         inSublemmata = false
      elseif string.match(str, "^\\end{Dictionary}") then
         -- we reached the end of the dictionary
         -- write last lemma to file
         if prevlemma and prevlemma ~= '' then
            result[prevlemma] = lemmacontent
         end
         -- start sorting process
         newkeys = sortLemma(result)
         -- use the keys to retrieve the values in the sorted order
         for _, k in ipairs(newkeys) do
            f:write('\n\\Lemma{' .. k .. '}' .. result[k])
         end
         -- if lines follow they should be processed as well
         f:write('\n\\end{ModDictionary}', "\n")
         inDictionary = false
      end              
      if inDictionary == false then
--            if str ~= '\\end{Dictionary}' then
--               f:write(str, "\n")
--            end
      else
         if inSublemmata == true then
            sublemma, sublemmatext = string(str, "^\\Sublemma{(.-)}(.*)$")--$
            if sublemma and sublemma ~= '' then
            -- we found a new sublemma
               if prevsublemma and prevsublemma ~= '' then
                  sl[prevsublemma] = sublemmacontent
               end
               -- remember new sublemma as prevsublemma for next entry
               prevsublemma = sublemma
               sublemmacontent = sublemmatext
            else
               sublemmacontent = sublemmacontent .. "\n" .. str
            end               
         else
            lemma, text = string.match(str, "^\\Lemma{(.-)}(.*)$") --$
            if lemma and lemma ~= '' then
            -- we found a new lemma
            -- write previous lemma (if any) to table
               if prevlemma and prevlemma ~= '' then
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
   f:close()
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
   -- before sorting, we remove dashes at the end
   local s1 = string.gsub(a, '-$', '')--$
   local s2 = string.gsub(b, '-$', '')--$
   local so1, so2
   
   -- texio.write_nl('Compare ' .. s1 .. ' with ' .. s2)
   -- if both strings are equal we stop processing
   if s1 ~= s2 then
   -- as long as both strings have equal characters (and are both not empty)
   -- get the next sorting letter and compare them
      while s1 ~= '' and s2 ~= '' do
         -- texio.write_nl('Vorher: ' .. s1 .. ' ' .. s2)
         so1, s1 = sortletter(s1)
         so2, s2 = sortletter(s2)
         -- texio.write_nl('Sort order: ' .. so1 .. ' ' .. so2)
         -- texio.write_nl('Rest: ' .. s1 .. ' ' .. s2)
         if so1 < so2 then
            return true
         elseif so1 > so2 then
            return false
         end
         -- texio.write_nl('Nachher: ' .. s1 .. ' ' .. s2)
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
   ["j"] = 18, ["jh"] = 19, ["ñ"] = 20, ["ṭ"] = 21, ["ṭh"] = 22,
   ["ḍ"] = 23, ["ḍh"] = 24, ["ṇ"] = 25, ["t"] = 26, ["th"] = 27, ["d"] = 28, 
   ["dh"] = 29, ["n"] = 30, ["p"] = 31, ["ph"] = 32, ["f"] = 33, ["b"] = 34,
   ["bh"] = 35, ["m"] = 36, ["y"] = 37, ["r"] = 38, ["l"] = 39, ["v"] = 40,
   ["ś"] = 41, ["ṣ"] = 42,["s"] = 43, ["h"] = 44, ["ḷ"] = 45}   
   local sortletter = ''
   
   -- If s is at last two characters long, we check, whether the first two 
   -- characters form a valid sorting letter (according to our scheme)
   if string.len(s) > 1 then
      sortletter = string.sub(s,1,2)
      if gujorder[sortletter] == nil then
         sortletter = string.sub(s,1,1)
      end
   else -- otherwise just take the first character and check
      sortletter = string.sub(s,1,1)   
   end
   -- texio.write_nl(s .. ' ' .. sortletter .. ' ' .. string.len(sortletter))
   if gujorder[sortletter] then
      return gujorder[sortletter], string.sub(s, string.len(sortletter) + 1)
   else -- if there is a letter we don't know, insert at the very end
      return 99, string.sub(s, string.len(sortletter) + 1)
   end
end