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
