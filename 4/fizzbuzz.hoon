:: builds a gate with a parameter n
:: which finds the sum of all the natural numbers below it 
:: which are evenly also divisible by 3 or 5
:: and returns that sum
::  
|=  n=@
:: pins an atom "sum" with a value of 0 to the subject
::
=/  sum  0
:: pins an atom "i" to use as a counter
::
=/  i  0
:: begins recursion
::
|-
:: if, i == n
::
?:  =(i n)
  :: then, return sum
  ::
  sum
:: else, if, i % 3 == 0
::
?:  =(0 (mod i 3))
  :: then, recurse with i = i + 1, sum += n
  ::
  $(i +(i), sum (add sum i))
:: else, if, i % 5 == 0
::
?:  =(0 (mod i 5))
  :: then, recurse with i = i + 1, sum += i
  ::
  $(i +(i), sum (add sum i))
:: else, recurse with i = i - 1, sum = sum
::
$(i +(i), sum sum)
