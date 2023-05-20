! Project Euler #016
! Sum of digits of 2^1000

! 2^20 ~ 1 million = 10^6
! 1000/20 = 50 => 2^1000 ~ 10^(50*6) = 10^300
! we initialise an array of 310 integers to store the digits of 2^1000 (300 + 10 for safety)

program ProjectEuler016
  implicit none
  integer, parameter:: sz = 310
  integer, dimension(sz) :: digits
  integer :: i, j, n

  n = 1000

  ! set all digits to 0
  do i = 1, sz
    if (i > 1) then
      digits(i) = 0
    else
      digits(i) = 1
    end if
  end do

  ! lets start looping
  do i = 1, n
    ! multiply each digit by 2
    do j = 1, sz-1
      digits(j) = digits(j) * 2
    end do
    ! this loop has to be seperate
    ! to prevent the carry from doubling too
    do j = 1, sz-1
      if (digits(j) > 9) then
        digits(j+1) = digits(j+1) + 1
        digits(j) = digits(j) - 10
      end if
    end do
  end do

  ! sum the digits
  n = 0
  do i = 1, sz
    n = n + digits(i)
  end do

  print *, n

end program ProjectEuler016