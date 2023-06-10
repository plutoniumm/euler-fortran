! Project Euler #067
! Maximum path sum I

program ProjectEuler067
  implicit none
  integer :: i, value
  integer, dimension(100,100) :: numbers
  integer, dimension(100) :: sums

  open(unit=42, file='./data/067.txt', status='old', action='read')
  do i = 1, 100
    read(42, *) numbers(i, 1:i)
  end do
  close(42)

  ! Method SAME AS 017

  ! initialize sums
  do i = 1, 100
    sums(i) = 0
  end do

  ! start at the bottom
  do i = 100, 1, -1
    ! for each number in the row
    do value = 1, i
      ! ith sum = current num         + max of (left, right)
      sums(value) = numbers(i, value) + max(sums(value), sums(value+1))
    end do
  end do

  print *, sums(1)
end program ProjectEuler067