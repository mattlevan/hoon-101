|=  raw=tape
=<
::  change the leg raw to the uppercase form
::
=.  raw  (cuss raw)
::  call (pull?) the convert arm with raw as the sample
::
%-  convert  raw
|%
++  convert
  ::  build a gate with sample a of type tape
  ::
  |=  a=tape
  ::  cast the output to a tape
  ::
  ^-  tape
  ::  pin an empty tape to the subject with face "out"
  ::
  =/  out  ""
  ::  pin chart to the subject to make map lookups convenient
  ::
  =/  chart  ~(got by table)
  ::  recurse through the sample tape a
  ::
  |-
  ::  if, a is null
  ::
  ?~  a
    ::  then, return out
    ::
    out
  ::  else, recurse with a's tail and 
  ::  the morse translation of a's head welded onto out
  ::
  $(a t.a, out (weld out (trip (chart i.a))))
++  table
  %-  my
  :~  :-  'A'  '.-'
      :-  'B'  '-...'
      :-  'C'  '-.-.'
      :-  'D'  '-..'
      :-  'E'  '.'
      :-  'F'  '..-.'
      :-  'G'  '--.'
      :-  'H'  '....'
      :-  'I'  '..'
      :-  'J'  '.---'
      :-  'K'  '-.-'
      :-  'L'  '.-..'
      :-  'M'  '--'
      :-  'N'  '-.'
      :-  'O'  '---'
      :-  'P'  '.--.'
      :-  'Q'  '--.-'
      :-  'R'  '.-.'
      :-  'S'  '...'
      :-  'T'  '-'
      :-  'U'  '..-'
      :-  'V'  '...-'
      :-  'W'  '.--'
      :-  'X'  '-..-'
      :-  'Y'  '-.--'
      :-  'Z'  '--..'
      :-  '0'  '-----'
      :-  '1'  '.----'
      :-  '2'  '..---'
      :-  '3'  '...--'
      :-  '4'  '....-'
      :-  '5'  '.....'
      :-  '6'  '-....'
      :-  '7'  '--...'
      :-  '8'  '---..'
      :-  '9'  '----.'
  ==
--
