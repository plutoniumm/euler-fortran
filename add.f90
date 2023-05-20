! Project Euler #012
! First triangle number with over 500 divisors

function Triangle(n) result(Triangle)
  implicit none
  integer(kind=4), intent(in) :: n
  integer(kind=4) :: Triangle
  Triangle = n * (n + 1) / 2
end function Triangle

program ProjectEuler012
  implicit none

end program ProjectEuler012