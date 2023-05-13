! Project Euler #007
! find the nth prime number
function isPrime(n) result(is)
  integer, parameter :: i32 = selected_int_kind(32)
  ! the 10,000th prime is ~ 100,000, we need only 2 witnesses
  ! since thats << 1.2 Million
  integer(kind=i32), intent(in) :: n
  logical :: is
  integer, dimension(3) :: w = [2, 3, 5]
  integer :: witness = 0, r, saved_r
  integer(kind=i32) :: d, hold

  is = .false.
  d = n - 1
  r = 0
  do while(mod(d, 2) == 0)
    d = d / 2
    r = r + 1
  end do

  ! Method
  !
  ! Express n as (2^r * d) + 1 ! basically getting rid of as much 2 as possible
  ! do w^d mod n = k
  ! pass if k = 1 (for r) or k = n - 1 (for some 0<= value < r)
  ! else
  ! check next witness (till limit) then return false

  do i = 1, size(w)
    witness = w(i)
    hold = mod(witness**d, n)
    if (hold == 1) then
      is = .true. ! PROBABLY prime
    else
      saved_r = r
      do while (r > 0)
        if (hold == n - 1) then
          is = .true. ! PROBABLY prime
          exit
        else
          hold = mod(hold**2, n)
          r = r - 1
        end if
      end do
    end if
    ! if is false here, then its not prime
    if (.not. is) then
      if(mod(n, 3)==0 .or. mod(n, 5)==0 .or. mod(n, 7)==0 .or. mod(n, 11)==0 .or. mod(n, 13)==0 .or. mod(n, 17)==0) then
        ! Sanity skip
      else
        print *, "Failed", n ,"for ", witness
      end if
      exit
    end if
  end do
end function isPrime

program ProjectEuler007
  implicit none
  integer, parameter :: i32 = selected_int_kind(32)

  logical :: isPrime
  integer :: index = 0
  ! change as needed
  integer(kind=i32) :: current = 0_i32

  ! Method
  ! 1. Generate primes until we have 10,001
  ! 2. increment if is prime else continue
  ! Generation
  ! 1. Generate odd numbers
  ! 2. Check if they are prime -> add to array

  index = 100 ! check till
  current = 3_i32 ! current number

  ! 2, 3 are primes
  do while(index > 1)
    if(isPrime(current)) then
      index = index - 1
    end if
    current = current + 2
  end do

  print *, (current - 2)

end program ProjectEuler007



! 29 = 2^2 * 7 + 1
! 2^7 = 128 % 29 = 12