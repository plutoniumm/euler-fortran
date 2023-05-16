! Project Euler #005
! smallest +ve number divisible by all of 1-20
recursive function gcd (m,n) result (g)
  implicit none
  integer, parameter :: i32 = selected_int_kind(32)
  integer(kind=i32), intent(in) :: m,n
  integer(kind=i32) :: g

  ! Method
  !
  ! Euclid's algorithm
  ! gcd(m,n) = gcd(n,m%n)
  !
  ! gcd(m,0) = m

  if (n == 0_i32) then
    g = m
  else
    g = gcd(n,mod(m,n))
  end if
end function gcd

function lcm(m,n) result (l)
  implicit none
  integer, parameter :: i32 = selected_int_kind(32)
  integer(kind=i32) gcd, l
  integer(kind=i32), intent(in) :: m,n

  l = m*n/gcd(m,n)
end function lcm

program ProjectEuler005
  implicit none

  integer, parameter :: i32 = selected_int_kind(32)
  integer(kind=i32) lcm
  integer(kind=i32) :: n, i=20_i32

  ! Method
  !
  ! Calculate GCD of n,m and use it to calculate LCM
  ! LCM(n,m) = n*m/GCD(n,m)
  !
  ! LCM(a,b,c) = LCM(LCM(a,b),c) and so on

  n = 1_i32
  do while (i > 1_i32)
    n = lcm(n,i)
    i = i - 1
  end do

  print *, n

end program ProjectEuler005