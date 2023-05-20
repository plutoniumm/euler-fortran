! Project Euler #013
! find 1st 10 digits of sum of given 100 numbers. (they're all 50 digits)

program ProjectEuler013
  implicit none
  character(len=50), dimension(100) :: numbers
  integer, dimension(13):: colsums
  integer(kind=4) :: i

  ! Since we can see numbers are not 9s
  ! we can just add the first 13 digits of each number
  ! and report the first 10 digits of the sum

  ! read in the numbers
  open(unit=42, file='./data/013.txt', status='old', action='read')

  do i = 1, 100
    read(42,*) numbers(i)
  end do

  ! for each col sum the nth (character - 48)
  ! save number %10 and carry number / 10
  ! add carry to sum of n-1th col

  ! 10 digits + 2 carry digits + 1 for good measure = 13
  do i = 1, 13
    colsums(i) = sum( (ichar(numbers(:)(i:i)) - 48) )
  end do

  do i = 13, 2, -1
    colsums(i-1) = colsums(i-1) + colsums(i)/10
    colsums(i) = mod(colsums(i),10)
  end do

  ! print the first 10 digits of the sum
  print *, colsums(1:8)

end program ProjectEuler013