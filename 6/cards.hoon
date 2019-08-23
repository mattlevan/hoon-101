::
::  write a %say generator that takes two arguments, 
::  x and y, and produces a list of x lists (hands) 
::  of y distinct cards from a standard 52 card deck.
::
:-  %say
::  require x and y atoms as input
::
|=  [[* eny=@uvJ *] [x=@ud y=@ud ~] ~]
::  produce a noun (is there a need to be more specific here?)
::
:-  %noun
::  use the cards core here
::
=<  =~  (deal-game [new-deck new-hands])
      (deal-hands [x y])
      hands
    ==
::  define the cards core
::
|%
::  leg that stores a fresh deck of cards as a (list @t)
::
++  new-deck
  :~  '♥1'  '♦1'  '♣1'  '♠1'
      '♥2'  '♦2'  '♣2'  '♠2'
      '♥3'  '♦3'  '♣3'  '♠3'
      '♥4'  '♦4'  '♣4'  '♠4'
      '♥5'  '♦5'  '♣5'  '♠5'
      '♥6'  '♦6'  '♣6'  '♠6'
      '♥7'  '♦7'  '♣7'  '♠7'
      '♥8'  '♦8'  '♣8'  '♠8'
      '♥9'  '♦9'  '♣9'  '♠9'
      '♥10' '♦10' '♣10' '♠10'
      '♥J'  '♦J'  '♣J'  '♠J'
      '♥Q'  '♦Q'  '♣Q'  '♠Q'
      '♥K'  '♦K'  '♣K'  '♠K'
      '♥A'  '♦A'  '♣A'  '♠A'
  ==
::  leg that stores an empty list of hands
::
++  new-hands  (list (list @t))
::  arm that produces a door
::
++  deal-game
  ::  deck is the list of cards
  ::  hands is the list of hands
  ::  x is the number of hands
  ::  y is the number of cards in each hand
  ::
  |_  [deck=(list @t) hands=(list (list @t))]
  ::  arm to deal hands
  ::
  ++  deal-hands
    |=  [x=@ud y=@ud]
    ^-  (list (list @t))
    ?:  (gth (mul x y) (lent deck))
      ~&  'not enough cards in the deck'  !!
    ?&  =(x 0)
      =(y 0)
    hands
    ?&  (gth x 0)
      =(y 0)
    +>.$(hands (weld ~[hands (deal-hand y)]))
  ++  deal-hand
    |=  [y=@ud]
    ^-  (list @t)
    =/  hand=(list @t)
    |-
    ?:  =(y 0)
      hand
    $(hand (weld hand (deal-card)), y (dec y))
  ++  deal-card
  --
--
