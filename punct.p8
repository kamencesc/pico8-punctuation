pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- punctuation text
--
-- francesc bofill
-- kamencesc
-- 2025
--
-- https://github.com/kamencesc/pico8-punctuation

-- how it works
-- ctrl+p and use puny font
-- A E I O U close accent 
-- A` E` O` open accen
-- I# U# dieresis 
-- A^ E^ I^ O^ U^ circumflex
-- A* E* I* O* U* anunaasika
-- N spanish n
-- C c-cedilla

function punct(txt)
 local ret,n="",1
 if (txt==nil or #txt==0) return ret
 while n<=#txt do
  local l1,l2=sub(txt,n,n),sub(txt,n+1,n+1)
  local intab=false
  for i in all(split("A,E,I,O,U")) do
   if (l1==i) intab=true
  end
  if l2=="`" then
   ret..=l1.."\vp`"
   n+=1
  elseif l2=="#" then
   ret..=l1.."\vq"..chr(20)
   n+=1
  elseif l2=="^" then
   ret..=l1.."\vq^"
   n+=1
  elseif l2=="*" then
   ret..=l1.."\ve."
   n+=1
  elseif l1=="C" then
   ret..=".\vuC"
  elseif l1=="N" then
   ret..="N\vm-"
  elseif intab then
   ret..=l1.."\vr'"
  else
   ret..=l1
  end
  n+=1
 end
 return ret
end
cls()
?punct("A E I O U"),50,10
?punct("A` E` I` O` U` "),50,20
?punct("A# E# I# O# U# "),50,30
?punct("A* E* I* O* U* "),50,40
?punct("A^ E^ I^ O^ U^ "),50,50
?punct("C N"),60,60

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
