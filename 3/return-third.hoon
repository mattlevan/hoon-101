|=  a=(list)                :: accept a list
=/  n=@  1                  :: tack n as 1
|-                          :: recurse
?~  a  !!                   :: if a is null, crash
?:  =(3 n)  i.a             :: else if n==3, return a's head
$(a t.a, n +(n))            :: loop with a=(a's tail) and n=(n+1)
