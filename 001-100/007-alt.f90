program PrimeChecker
    implicit none
    integer, dimension(10001) :: primes
    integer :: numPrimes, candidate, i, j
    logical :: isPrime

    numPrimes = 0
    candidate = 2

    do while (numPrimes < SIZE(primes))
        isPrime = .true.

        do i = 1, numPrimes
            if (primes(i)**2 > candidate) exit
            if (mod(candidate, primes(i)) == 0) then
                isPrime = .false.
                exit
            end if
        end do

        if (isPrime) then
            numPrimes = numPrimes + 1
            primes(numPrimes) = candidate
        end if

        candidate = candidate + 1
    end do

    print *, primes(numPrimes)

end program PrimeChecker
