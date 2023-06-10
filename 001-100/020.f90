! Project Euler #020
! Sum of digits in 100!


program ProjectEuler020
  implicit none
  integer :: i, j, value
  integer, dimension(150) :: digits

  ! Initialize digits to 0
  do i = 1, 150
    digits(i) = 0
  end do
  digits(1) = 1

  ! Method
  ! I really can't think of anything better
  ! than just implementing BigInt manually
  ! to make life easier, we'll shift out the 0s

  do i = 1, 100
    do j = 1, 150
      digits(j) = digits(j) * i
    end do
    do j = 1, 149
      do while (digits(j) > 9)
        digits(j+1) = digits(j+1) + digits(j) / 10
        digits(j) = mod(digits(j), 10)
      end do
    end do
  end do

  ! sum
  value = 0
  do i = 1, 150
    if (digits(i) < 9) then
      value = value + digits(i)
    else
      do while (digits(i) > 0)
        value = value + mod(digits(i), 10)
        digits(i) = digits(i) / 10
      end do
    end if
  end do

  print *, value
end program ProjectEuler020