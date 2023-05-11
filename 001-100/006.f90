! Project Euler #006
! find sum n^2 - (sum n)^2 till 100

program ProjectEuler006
  implicit none

  integer, parameter :: i32 = selected_int_kind(32)
  integer(kind=i32) :: n=100_i32
  integer(kind=i32) :: value = 0_i32

  ! Method
  !
  ! We can use the formulas for each of them
  ! sum n = n(n+1)/2
  ! sum n^2 = n(n+1)(2n+1)/6
  ! simplified
  ! sum n^2 - (sum n)^2  = n(n+1)(3n^2 - n - 2)/12

  value = n*(n+1)*(3*n**2 - n - 2)/12

  print *, value
end program ProjectEuler006