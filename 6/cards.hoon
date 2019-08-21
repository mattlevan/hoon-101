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
=<  =~  (new-deal new-deck)
      (deal-hands [x y])
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
::  arm that produces a door
::
++  new-deal
  ::  hands is the data to be produced, stateful
  ::  deck is the list of cards, stateful
  ::
  |_  [hands=(list (list @t)) deck=(list @t)]
  ::  deals x hands of y distinct cards
  ::
  ++  deal-hands
    |=  [x=@ud y=@ud]
    ::  produce a list of hands as a (list (list @t))
    ::
    ^-  (list (list @t))
    ::  cal
  ::  deals a hand of y distinct cards
  ::
  ++  deal-hand
    |=  y=@ud
    ^-  (list @t)
    =/  hand=(list @t)
    =/  rng  ~(. og eny)
    |-
    ?:  =(y 0)
      hand
    $(y (dec y), hand (weld ~[(deal-card (rad:rng (lent deck)))]))
  ::  deals a single card
  ::
  ++  deal-card
    ::  accepts an index n to snag a card from the deck
    ::
    |=  n=@ud
    ::  produce a card as a cord
    ::
    ^-  @t

  --
--
