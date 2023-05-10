! Project Euler #004
! Find largest palindrome from product of two 3-digit numbers.
function palindrome(i) result(is)
  ! implicit none
  integer, intent(in) :: i
  integer :: temp, rev;
  logical :: is

  ! Method
  ! Mod 10, store remainder, divide by 10, repeat until 0
  ! as you go, add remainder and multiply by 10 each time (rev)
  ! subtract
  ! if 0, then palindrome

  temp = i
  rev = 0
  do while(temp>0)
    rev = (rev*10) + mod(temp,10)
    temp = temp/10
  end do

  if (rev == i) then
    is = .true.
  else
    is = .false.
  end if
end function palindrome


program ProjectEuler004
  implicit none

  logical :: palindrome
  integer :: i = 999
  integer :: j = 999
  integer :: max = 0

  ! for 3 digit numbers
  do while (i>99)
    do while (j>99)
      ! update max if a larger palindrome is found
      if (i*j > max) then ! this is done first to save computation of palindrome if not needed
        if (palindrome(i*j)) then
          max = i*j
        end if
      end if
      j = j - 1
    end do

    i = i - 1
    j = i
  end do

  print *, max
end program ProjectEuler004