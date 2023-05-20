! Project Euler #015
! Lattice paths on a 20x20 grid

program ProjectEuler015
  implicit none
  integer:: number, i
  integer(kind=8):: paths, factorial, oddsum

  ! Method
  !
  ! we just need 19 rights and 19 downs
  ! we can just combinatorics this
  ! more generally #lattice paths from (0,0) to (n,k) is (n+k)Cn
  ! so for us it is 2nCn = (2n)! / (n!)^2 = 2^n * (prod_{k=1}^n (2n=1)) / n!
  ! = prod 2*(2n+1-i) / i

  number = 20

  oddsum = 1
  do i = 1, number
    oddsum = (2 * oddsum * (2*i - 1)) / i
  end do

  print *, oddsum

end program ProjectEuler015