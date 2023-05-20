! Project Euler #012
! First triangle number with over 500 divisors

program ProjectEuler012
  implicit none
  integer(kind=4) :: i, j, num, divisors, sqrt_num

  ! Since, triangle numbers can never be square numbers
  ! we can just look first 250 < sqrt(num)
  i = 0
  divisors = 0
  do while(divisors < 250)
    i = i + 1
    num = (i * (i + 1)) / 2
    divisors = 0
    sqrt_num = int(real(i + 1)/1.414) ! sqrt[n(n+1)/2] ~ (n+1)/sqrt(2)
    do j = 1, sqrt_num
      if (mod(num, j) == 0) then
        divisors = divisors + 1
      end if
    end do
  end do

  print *, "index: ", i, "triangle number: ", num
end program ProjectEuler012