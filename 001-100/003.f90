! Project Euler #003
! find largest prime factor of 600851475143
program ProjectEuler003
  implicit none

  integer, parameter :: i32 = selected_int_kind(32)
  integer, parameter :: i16 = selected_int_kind(16)
  integer(kind = i32) :: N = 600851475143_i32
  integer(kind = i32) :: factor = 2_i32

  integer :: root = 775147
  integer :: max = 1

  ! Method [root = sqrt(600851475143) = 775147] rounded up
  !
  ! Check if N is divisible by 2^i
  ! Loop through all numbers from 3 to root
  ! If factor is found loop N  = N/factor while mod(N, factor) == 0
  ! Increment factor by 2 till root or N == 1

  do while (mod(N, factor) == 0_i32)
    N = N / factor
  end do

  ! run for odd numbers from 3 to root
  do factor = 3_i32, root, 2_i32
    if (mod(N, factor) == 0_i32) then
      do while (mod(N, factor) == 0_i32)
        N = N / factor
      end do
      max = factor
    end if

    if (N == 1_i32) then
      exit
    end if
  end do

  ! this is the largest prime factor
  if (N > 1_i32) then
    max = N
  end if

  print *, max
end program ProjectEuler003