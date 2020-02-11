-- 2020/02/11 v0.23.0
packagedata            = packagedata or { } -- namespace proposal for packages
local word_count       = { threshold = 3, }
packagedata.word_count = packagedata.word_count or word_count

dofile(kpse.find_file"char-def.lua")      -- unicode tables
dofile(kpse.find_file"lualibs-table.lua") -- old Context table code

local utf  = unicode.utf8
local node = node
local type = type

local lower, utfchar, utfvalues = string.lower, utf.char, string.utfvalues
local tableconcat, iowrite      = table.concat, io.write
local stringformat, texprint    = string.format, tex.print

local collected  = { total      = 0, unique     = 0, }

local traverse_nodes  = node.traverse
local chardata        = characters.data

local glyph_code      = node.id"glyph"
local disc_code       = node.id"disc"
local kern_code       = node.id"kern"
local kerning_code    = 0 -- from font

local is_letter = table.tohash { "ll", "lm", "lo", "lt", "lu" }

local charcache = { } --- memo without metatable
local lcchar = function(code)
  if code then
    if charcache[code] then return charcache[code] end
    local c = chardata[code]
    c = c and c.lccode
    if c then --utfstring
      if type(c) == "table" then
        c = utfchar(unpack(c))
      else
        c = utfchar(c)
      end
    else
      if type(code) == "number" then
        c = utfchar(code)
      else
        c = code
      end
    end
    charcache[code] = c
    return c
  end
end
    
local lowerchar = function (str)
  local new, n = { }, 0
  for val in utfvalues(str) do
    n = n + 1
    new[n] = lcchar(val) -- could be inlined here as well ..
  end
  return tableconcat(new)
end

local function mark_words (head, whenfound)
  local current, done = head, nil, 0, false
  local str, s, nds, n = { }, 0, { }, 0
  local function action()
    if s > 0 then
      local word = tableconcat(str, "", 1, s)
      local mark = whenfound(word)
      if mark then
        done = true
        for i=1,n do
          mark(nds[i])
        end
      end
    end
    n, s = 0, 0
  end
  while current do -- iterate
    local id = current.id
    if id == glyph_code then
      local components = current.components
      if components then
        n = n + 1
        nds[n] = current
        for g in traverse_nodes(components) do
          s = s + 1
          str[s] = utfchar(g.char)
        end
      else
        local code = current.char
        local data = chardata[code]
        if data and is_letter[data.category] then
          n = n + 1
          nds[n] = current
          s = s + 1
          str[s] = utfchar(code)
        elseif s > 0 then
          action()
        end
      end
    elseif id == disc_code then -- take the replace
      if n > 0 then
        n = n + 1
        nds[n] = current
      end
    elseif id == kern_code and current.subtype == kerning_code and s > 0 then
      -- ok
    elseif s > 0 then
      action()
    end
    current = current.next
  end
  if s > 0 then
      action()
  end
  return head, done
end

local known = { }
local function insert_word (str) -- -Y´sweep(l,s)¡
  if #str >= word_count.threshold then
    str = lowerchar(str)
    if not known[str] then
      collected.unique = collected.unique +1
      known[str] = true
    end
    collected.total = collected.total + 1
  end
end

local callback = function (head)
  return mark_words(head, insert_word)
end

word_count.callback = callback

local current_count = function ()
  tex.sprint('The document consists of ',collected.total,
  ' words (using a threshold of ',word_count.threshold,')')
end

word_count.current_word_count = current_count

word_count.set_threshold = function (n)
  if n then
    word_count.threshold = n
  end
end

local f_dump = [[

-A········································································
                            Document stats.
········································································
    Threshold:              %d
    Total number of words:  %d
    Number of unique words: %d
········································································

]]

local dump_total = function ()
  --print(table.serialize(collected))
  iowrite(stringformat(f_dump,
                       word_count.threshold,
                       collected.total,
                       collected.unique))
end

word_count.dump_total_word_count = dump_total

local f_print = [[

------------------------------------------------------------------------\n
                            Document stats.\n
------------------------------------------------------------------------\n
    Threshold:              %d\n
    Total number of words:  %d\n
    Number of unique words: %d\n
------------------------------------------------------------------------\n

]]

local print_total = function ()
  --print(table.serialize(collected))
  tex.sprint(stringformat(f_print,
                       word_count.threshold,
                       collected.total,
                       collected.unique))
end

word_count.print_total_word_count = print_total

local print_total_to_log = function ()
  --print(table.serialize(collected))
  tex.sprint([[\ClassInfo{brill}{The document consists of 
  ]],collected.total,' words (using a threshold of ',word_count.threshold,')}')
end

word_count.print_total_word_count_to_log = print_total_to_log


