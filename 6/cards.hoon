::
::  write a %say generator that takes two arguments, 
::  x and y, and produces a list of x lists (hands) 
::  with y distinct cards each
::
:-  %say
|=  [[* eny=@uvJ *] [x=@ud y=@ud ~] ~]
:-  %noun
=<  hands:(deal-hands [x y eny])
|%
+$  suit  @t
+$  rank  @t
+$  cart  [s=suit r=rank]
+$  deck  (list cart)
++  suits  %-  limo  ~['♥' '♠' '♣' '♦']
++  ranks  %-  limo  ~['A' '2' '3' '4' '5' '6' '7' '8' '9' '10' 'J' 'Q' 'K']
++  make-deck
  ^-  deck
  =|  new-deck=deck
  =/  i  1
  |-
  ?:  (gth i 4)
    new-deck
  =/  j  1
  |-
  ?.  (lte j 13)
    ^$(i +(i))
  %=  $
    j         +(j)
    new-deck  [(num-to-suit i) (num-to-rank j)]^new-deck
  ==
++  num-to-suit
  |=  n=@ud
  ^-  suit
  ?:  (gth n 4)
    !!
  (snag (dec n) suits)
++  num-to-rank
  |=  n=@ud
  ^-  rank
  ?:  (gth n 13)
    !!
  (snag (dec n) ranks)
++  shuffle-deck
  |=  [unshuffled=deck e=@uvJ]
  ^-  deck
  =|  shuffled=deck
  =/  rnd  ~(. og e)
  =/  remaining  (lent unshuffled)
  |-
  ?:  =(remaining 1)
    :_  shuffled
    (snag 0 unshuffled)
  =^  index  rnd  (rads:rnd remaining)
  %=  $
    shuffled    (snag index unshuffled)^shuffled
    remaining   (dec remaining)
    unshuffled  (oust [index 1] unshuffled)
  ==
++  deal-hands
  |=  [num-hands=@ud num-cards=@ud e=@uvJ]
  ^-  [hands=(list deck) rest=deck]
  =/  game-deck  (shuffle-deck [make-deck e])
  =|  hands=(list deck)
  ?:  (gth (mul num-hands num-cards) (lent game-deck))
    !!
  |-
  ?:  =(num-hands 0)
    [hands game-deck]
  =^  hand  game-deck  (deal-hand [num-cards game-deck])
  %=  $
    num-hands  (dec num-hands)
    hands      [hand hands]
  ==
++  deal-hand
  |=  [n=@ud d=deck]
  ^-  [hand=deck rest=deck]
  :-  (scag n d)
  (slag n d)
--
