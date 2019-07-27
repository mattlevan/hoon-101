::
::::
:: 
:: comments.hoon 
::
:: builds a gate with an unsigned integer n as its parameter
::
|=  n=@ud
:: pins t to the subject with a value of 1
::
=/  t=@ud  1
:: starts recursion
::
|-
:: if, n == 1 (base case)
::
?:  =(n 1)
  :: then, t
  ::
    t
:: else, recurse with n=n-1 and t=t*n
::
$(n (dec n), t (mul t n))
::
::::
::
:: return-third.hoon
::
:: builds a gate with a list as its parameter
::
|=  a=(list)
:: tacks n to the subject with a value of 1
::
=/  n=@  1
:: recursion begins
::
|-
:: if, a is null
::
?~  a  
  :: then, crash
  ::
  !!
:: else, if, n=3
::
?:  =(3 n)
  :: then, return a's head
  ::
  i.a
:: else, loop with a=(a's tail0 and n=(n+1)
::
$(a t.a, n +(n))
