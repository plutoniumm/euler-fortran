! Project Euler #009
! Pythogorean Triplet such that a + b + c = 1000. Find a*b*c

program ProjectEuler009
  implicit none
  integer :: a,b,c,m,n,num

  ! Method
  !
  ! There is a special generator for Pythagorean triplets
  ! ANY value of a,b WILL generate a triplet for sure
  ! This also spans all "primitive" triplets
  ! (m^2 + n^2)^2 = (2mn)^2 + (m^2 - n^2)^2
  !
  ! So A+B+C = m^2 + n^2 + 2mn + m^2 - n^2 = 2m^2 + 2mn = 2m(m + n)
  ! 2m(m + n) = 1000 or 250 or 40 | so we can generate n from m
  !
  ! And we need to find (m^2 + n^2)(m^2 - n^2)(2mn) = (m^4 + n^4)(2mn)

  ! loop over nums
  num = 1000
  do m = 2, num
  n = num/(2*m) - m
  if(n < 1) cycle
    a = ABS(m*m - n*n)
    b = ABS(2*m*n)
    c = ABS(m*m + n*n)
    if(a+b+c == num) then
      print *, a*b*c, "with", a, b, c
      exit
    end if
  end do

end program ProjectEuler009