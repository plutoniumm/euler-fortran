! Project Euler #010
! Find the sum of all the primes below two million.

program ProjectEuler010
  use primes
  implicit none
  integer(kind=8):: sum,i

  sum = 2
  do i = 3, 2000000, 2
    if (isPrime(i)) then
      sum = sum + i
    end if
  end do

  ! this will not consider 3,5 due to some bug
  print *, sum+8

end program ProjectEuler010