! Project Euler #013
! find 1st 10 digits of sum of given 100 numbers. (they're all 50 digits)

program ProjectEuler013
  implicit none
  integer(kind=4), dimension(100) :: numbers

  ! Since we can see numbers are not 9s
  ! we can just add the first 13 digits of each number
  ! and report the first 10 digits of the sum

  ! read in the numbers

  real, dimension(:,:), allocatable :: x
   integer :: n,m

   open (unit=99, file='./data/test.txt', status='old', action='read')
   read(99, *), n
   read(99, *), m
   allocate(x(n,m))

   do I=1,n,1
      read(99,*) x(I,:)
      write(*,*) x(I,:)
   enddo

end program ProjectEuler013