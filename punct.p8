pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
-- punctuation text
--
-- francesc bofill
-- kamencesc
-- 2025-2026
--
-- https://github.com/kamencesc/pico8-punctuation

-- how it works
-- ctrl+p and use puny font
-- a e i o u close accent 
-- a` e` o` open accen
-- i# u# dieresis 
-- a^ e^ i^ o^ u^ circumflex
-- a* e* i* o* u* anunaasika
-- n spanish n
-- c c-cedilla
-- !` inverted exclamation mark
-- ?` inverted question mark
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
   if (l1=="?") ret..="⁶:0200030107000000³c"
   if (l1=="!") ret..="⁶:0200020202000000³c"
   if (intab) ret..=l1.."ᵇp`"
   n+=1
  elseif l2=="#" then
   ret..=l1.."ᵇq"..chr(20)
   n+=1
  elseif l2=="^" then
   ret..=l1.."ᵇq^"
   n+=1
  elseif l2=="*" then
   ret..=l1.."ᵇe."
   n+=1
  elseif l1=="C" then
   ret..=".ᵇuC"
  elseif l1=="N" then
   ret..="Nᵇm-"
  elseif intab then
   ret..=l1.."ᵇr'"
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
?punct("!` ?`"),60,70
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
