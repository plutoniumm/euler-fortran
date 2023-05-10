! Project Euler #002
! Find sum of even terms in a Fibonacci sequence with max values <= 4 million
program ProjectEuler002
  implicit none
  integer :: n = 0, f1 = 1, f2 = 2
  integer :: sum = 0

  do while (f2 < 4000000)
    if (mod(f2, 2) == 0) then
      sum = sum + f2
    end if

    ! f1, f2 = 8, 13
    !
    ! f2 = 8 + 13 = 21
    ! f1 = 21 - 8 = 13
    !
    ! f1, f2 = 13, 21
    f2 = f1 + f2
    f1 = f2 - f1
  end do

  print *, sum
end program ProjectEuler002