! Project Euler #021
! Amicable numbers sum under 10000

function d(n) result(sum)
  implicit none
  integer, intent(in) :: n
  integer :: i, sum

  sum = 0
  do i = 1, n - 1
    if (mod(n, i) == 0) then
      sum = sum + i
    end if
  end do
end function d

function isAmic(n) result(isAmicable)
  implicit none
  integer, intent(in) :: n
  integer :: d
  logical :: isAmicable

  isAmicable = (n == d(d(n))) .and. (n /= d(n))
end function isAmic


program ProjectEuler021
  implicit none
  integer :: i, j, value
  logical :: isAmic

  ! Method
  ! only 1 loops is needed
  ! since we can use d(n) as other

  ! I can't realistically think of a way to do this
  ! with low memory and high speed

  value = 0
  do i = 1, 10000
    if (isAmic(i)) then
      value = value + i
    end if
  end do

  print *, value
end program ProjectEuler021