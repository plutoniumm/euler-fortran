! Project Euler #007
! find the 10,001th prime number

! Montgomery Modular Exponentiation
function mod_exp(base, exponent, modulus) result(result_mod)
  implicit none
  integer, parameter :: i32 = selected_int_kind(32)
  integer(kind=i32), intent(in) :: base, exponent, modulus
  integer(kind=i32) :: result_mod, base_mod, exponent_mod, exp_hold

  base_mod = mod(base, modulus)
  result_mod = 1_i32
  exp_hold = exponent

  do while (exp_hold > 0_i32)
    exponent_mod = mod(exp_hold, 2_i32)
    if (exponent_mod == 1_i32) then
      result_mod = mod(result_mod * base_mod, modulus)
    end if
    base_mod = mod(base_mod * base_mod, modulus)
    exp_hold = exp_hold / 2_i32
  end do

end function mod_exp


function isPrime(n) result(is)
  integer, parameter :: i32 = selected_int_kind(32)
  ! the 10,000th prime is ~ 100,000, we need only 2 witnesses
  ! since thats << 1.2 Million
  integer(kind=i32), intent(in) :: n
  logical :: is
  integer :: r, saved_r
  integer(kind=i32), dimension(2) :: w = [2, 3]
  integer(kind=i32) :: d, hold, witness
  integer(kind=i32) :: mod_exp

  is = .false.
  d = n - 1
  r = 0
  do while(mod(d, 2) == 0)
    d = d / 2
    r = r + 1
  end do

  print *, "d", d, "for n========", n

  ! Method
  !
  ! Express n as (2^r * d) + 1 ! basically getting rid of as much 2 as possible
  ! do w^d mod n = k
  ! pass if k = 1 (for r) or k = n - 1 (for some 0<= value < r)
  ! else
  ! check next witness (till limit) then return false

  do i = 1, size(w)
    witness = w(i)
    hold = mod_exp(witness, d, n)
    if (hold == 1) then
      is = .true. ! PROBABLY prime
    else
      saved_r = r
      powers: do while (saved_r > 0)
        if (hold == n - 1) then
          is = .true. ! PROBABLY prime>>>
          print *, "T-hold", hold, "for n", n, "witness", witness, "is", is
          exit powers
        else
          hold = mod_exp(hold,2_i32, n)
          print *, "F-hold", hold, "for n", n, "witness", witness, "is", is
          saved_r = saved_r - 1
        end if
      end do powers
    end if
    ! if is false here, then its not prime for the current witness
    if (.not. is) then
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

  index = 311 ! check till
  current = 3_i32 ! current number

  ! 2, 3 are primes
  do while(index > 1)
    if(isPrime(current)) then
      index = index - 1
      if(current>2045) then
        print *, current, index, "th prime"
      end if
    end if
    current = current + 2
  end do

  print *, (current - 2)

end program ProjectEuler007



! 29 = 2^2 * 7 + 1
! 2^7 = 128 % 29 = 12