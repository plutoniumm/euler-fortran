! Project Euler #019
! How many Sundays were on 1/XX between [1901, 2000] if 1/1/1900 was a Monday?

function offset(year) result(set)
  integer, intent(in) :: year
  integer :: set

  if (mod(year, 4) == 0 .and. mod(year, 100) /= 0) then
    set = 1
  else
    set = 0
  end if

  ! returns how many days to add to feb
end function offset

program ProjectEuler019
  implicit none
  integer :: i, j, value
  integer :: offset, current_day, hold
  integer, dimension(12) :: month_days


  month_days = [31, 28, 31, 30, 31, 30, &
                31, 31, 30, 31, 30, 31]

  value = -1
  hold = 0
  current_day = 1 ! sunday is 0, monday is 1, etc
  do i = 1901, 2000
    do j = 1, 12
      if (j == 2) then
        hold = offset(i)
      else
        hold = 0
      end if

      current_day = mod(current_day + month_days(j) + hold, 7)
      if (current_day == 0) then
        value = value + 1
      end if

    end do
  end do

  print *, value
end program ProjectEuler019