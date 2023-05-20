! Project Euler #014
! Longest Collatz sequence under 1M

function collatz(n) result(len)
  integer(kind=4), intent(in) :: n
  integer(kind=4) :: len
  integer(kind=8) :: hold

  hold = int(n,kind=8)
  len = 1

  do while(hold > 1)
    if(mod(hold,2)==0) then
      hold = hold/2
    else
      hold = (3 * hold) + 1
    end if
    len = len + 1
  end do

  ! sanity check, if we went beyond 1000 then something is wrong
  if(len > 1000) then
    print *, "Something went wrong, len > 1000"
    stop
  end if

end function collatz

program ProjectEuler014
  implicit none
  integer(kind=4) :: collatz
  integer(kind=4) :: i, len, max_len,len_creator

  len = 0
  max_len = 0
  len_creator = 0
  do i = 2, 1000000
    len = collatz(i)
    if(len > max_len) then
      max_len = len
      len_creator = i
    end if
  end do

  print *, max_len, "produced by", len_creator

end program ProjectEuler014

! expect 525 produced by 837799