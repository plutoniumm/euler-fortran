## Project Euler in Fortran

![Score](https://projecteuler.net/profile/plutoniumm.png)

I won't put in the answers here for obvious reasons. I will however put the code, it should run as is. The below should run it. Solved in order of [Website Archives](https://projecteuler.net/archives)

```bash
# problem-sets are grouped in 100s: 001-100, 101-200, etc.
# Each problem 'number' is of format: XXX
$ gfortran ./<problem-set>/<number>.f90 && ./a.out
```

The following resources were used to learn fortran: \
![Youtube Video](https://i.ytimg.com/vi/__2UgFNYgf8/mqdefault.jpg)

## Notes
### Prime Checking
In most cases to check primes I will use the [Miller-Rabin](https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test) test. It is a probabilistic test, but it is monstrously fast. You have to check primality of numbers against witnesses to get a probability of it being prime. There also also something called "Star Witnesses" which give you a 100% probability of a number being a prime upto a certain value.

[Nice Simple Explanation by Mr H Umble Pi](https://youtu.be/_MscGSN5J6o)

So these are the approximate ranges for the first few star witnesses which will perfectly test primes. [See More](https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test#Testing_against_small_sets_of_bases)
```json
{ // Approximations are rounded DOWN for safety
  // "max value": [star witnesses]
  "~1.3 Million": [2, 3],
  "~9.0 Million": [31, 73],
  "~25.3 Million": [2, 3, 5],
  "~2 Trillion": [2, 3, 5, 7, 11], // runs of primes are always safe bets
  "10^12": [2, 13, 23, 1662803], // The A Team
  "10^23": [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37], // for when you mean business
}
```

It is trivial to see how this may become problematic very fast since 2^N scales very fast. But the advantage is that we're not doing a^b we're doing a^b mod c. So we can use [Montgomery Modular Multiplication](https://en.wikipedia.org/wiki/Montgomery_modular_multiplication) to reduce the memory consumption of the process since it is guaranteed that for any value of a, b, c the result will be less than c. This is a very useful property since it allows us to use smaller data types to store the result of the exponentiation. Thus we can affort to use even 32 bit integers to store the result of a^b mod c for very large values of a^b as long as c is less than 2^32.

<!-- Montgomery Modular Multiplication -->
function mod_pow(base, exponent, modulus) result(result)
  integer, intent(in) :: base, exponent, modulus
  integer :: result, base_pow, exp_remainder

  result = 1
  base_pow = mod(base, modulus)

  do while (exponent > 0)
    exp_remainder = mod(exponent, 2)

    if (exp_remainder == 1) then
      result = mod(result * base_pow, modulus)
    endif

    base_pow = mod(base_pow**2, modulus)
    exponent = exponent / 2
  end do
end function mod_pow


<!--miller rabin 29 with 5 -->
29 - 1 = 28 = 2^2 * 7
5^7 = 78125
78125 % 29 = -1
