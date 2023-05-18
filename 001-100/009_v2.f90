! Project Euler #009
! Pythogorean Triplet such that a + b + c = 1000. Find a*b*c

program ProjectEuler009
  implicit none
  integer :: a,b,c,n, hold_a

  n = 1000
  do a = 2, n
    do b = a,n ! check for upper triangular matrix
    c = n - a - b
        if (a**2 + b**2 == c**2) then
          print *, a, b, c
          print *, a*b*c
          stop
        end if
    end do
  end do

end program ProjectEuler009