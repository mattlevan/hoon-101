::  builds a gate with an atom n as its sample
::
|=  n=@
::  composes two expressions, inverted
::  calls the goldbach arm with the sample n
::
=<  (goldbach n)
::  produces a core
::
|%
::  defines the core's first arm: 'prime'
::
++  prime
  ::  the arm is a gate with an atom n as its sample
  ::
  |=  n=@
  ::  casts the return type of the gate to a loobean
  ::
  ^-  ?
  ::  if, n is less than 2, return %.n
  ::
  ?:  (lth n 2)  |
  ::  else, if, n is less than 4, return %.y
  ::
  ?:  (lth n 4)  &
  ::  pin an atom i to the subject with a value of 2
  ::
  =/  i=@  2
  ::  pin an atom j to the subject with a value of 2
  ::
  =/  j=@  2
  ::  produces a trap and casts its return type to a loobean
  ::  recursion starting-point
  ::
  |-  ^-  ?
  ::  if, i * j == n, return %.n
  ::
  ?:  =((mul i j) n)  |
  ::  else, if, j == n / 2, return %.y
  ::
  ?:  =(j (div n 2))  &
  ::  else, if, i * j > n
  ::
  ?:  (gth (mul i j) n)
    ::  then, recurse with with i=2, j+=1
    ::
    $(i 2, j +(j))
  ::  else, recurse with i+=1
  ::
  $(i +(i))
::  defines the core's second arm: 'goldbach'
::
++  goldbach
  ::  produces a one-armed gate with an atom n as its sample
  ::
  |=  n=@
  ::  casts the gate's return type to a union of loobean and 
  ::  a cell with a [@ @] as its head and loobean as its tail
  ::
  ^-  ?(? [[@ @] ?])
  ::  if, n < 4 or n % 2 == 1, return %.n
  ::
  ?:  |((lth n 4) =((mod n 2) 1))  |
  ::  else, 
  ::  pin an atom i to the subject with a value of 2
  ::
  =/  i=@  2
  ::  pin an atom j to the subject with a value of n-2
  ::
  =/  j=@  (sub n 2)
  ::  produces a trap and casts its return type as on line 60
  ::  recursion starting-point
  ::
  |-  ^-  ?(? [[@ @] ?])
  ::  if, i is prime and j is prime, return [[i j] %.n]
  ::
  ?:  &((prime i) (prime j))  [[i j] |]
  ::  else, if, i+2 == n, return %.y
  ::
  ?:  =((add 2 i) n)  &
  ::  else, recurse with i+=1, j-=1
  $(i +(i), j (dec j))
::  end the definition of the core
::
--
