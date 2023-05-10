! Project Euler #001
! Find the sum of all the multiples of 3 or 5 below 1000.
program ProjectEuler001
  implicit none
  integer :: n = 0
  integer :: sum = 0

  ! go by 3s and skip by 5
  do n = 0, 1000, 3
    if(mod(n, 5) == 0) cycle
    sum = sum + n
  end do

  ! go by 5s
  do n = 0, 999, 5
    sum = sum + n
  end do

  print *, sum
end program ProjectEuler001