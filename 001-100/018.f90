! Project Euler #018
! Maximum path sum I

program ProjectEuler018
  implicit none
  integer :: i, value
  integer, dimension(15,15) :: numbers
  integer, dimension(15) :: sums

  open(unit=42, file='./data/017.txt', status='old', action='read')
  do i = 1, 15
    read(42, *) numbers(i, 1:i)
  end do
  close(42)

  ! Method
  ! Start at the bottom and work up
  ! For each row we'll find the maximum path sum for each number
  ! by adding the number to the maximum SUM below it
  ! we update the array adding upwards till we get (max, 0, 0...)

  ! initialize sums
  do i = 1, 15
    sums(i) = 0
  end do

  ! start at the bottom
  do i = 15, 1, -1
    ! for each number in the row
    do value = 1, i
      ! ith sum = current num         + max of (left, right)
      sums(value) = numbers(i, value) + max(sums(value), sums(value+1))
    end do
  end do

  print *, sums(1)
end program ProjectEuler018