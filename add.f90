! Project Euler #009
! Pythogorean Triplet such that a + b + c = 1000. Find a*b*c

program ProjectEuler009
  implicit none
  integer :: a,b,i,j,n

  ! Method
  !
  ! There is a special generator for Pythagorean triplets
  ! ANY value of a,b WILL generate a triplet for sure
  ! This also spans all triplets
  ! (a^2 + b^2)^2 = (2ab)^2 + (a^2 - b^2)^2
  !
  ! So a+b+c = a^2 + b^2 + 2ab + a^2 - b^2 = 2a^2 + 2ab = 2a(a + b)
  ! 2a(a + b) = 1000 | so we can generate b from a
  !
  ! And we need to find (a^2 + b^2)(a^2 - b^2)(2ab) = (a^4 + b^4)(2ab)

  n = 1000
  do a = 2, n
    b = n/(2*a) - a
    if (b < 0) exit
    if (b > a) cycle
    print *, b
  end do

end program ProjectEuler009