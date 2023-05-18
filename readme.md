## Project Euler in Fortran

![Score](https://projecteuler.net/profile/plutoniumm.png)

I won't put in the answers here for obvious reasons. I will however put the code, it should run as is. The below should run it. Solved in order of [Website Archives](https://projecteuler.net/archives)

```bash
# problem-sets are grouped in 100s: 001-100, 101-200, etc.
# Each problem 'number' is of format: XXX
$ gfortran ./<problem-set>/<number>.f90 && ./a.out

# Example
$ gfortran ./001-100/001.f90 && ./a.out # Problem 001

# Alternate solutions (if applicable) are also given with a suffix: _v2
$ gfortran ./001-100/007_v2.f90 && ./a.out # Problem 007, version 2
```

**List of Problems with Alternate Solutions**
| Problem Set | Problem Number |
| ----------- | -------------- |
| 001-100     | 007            |

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

It is trivial to see how this may become problematic very fast since $a^N$ scales very fast. This very nicely leads us into

> NOTE: Miller Rabin **IS NOT** faster than the normal method of generating and array of primes and checking against that. Its in fact much worse.
> BUT.
> 1. It let me learn about the algorithm
> 2. Miller Rabin actually lets you check if something for an arbitrary number. You don't have to start from 0 and go to N. You can start from any number and go to N OR in fact just check N.

### Calculating Large Exponents (Modulo)
The advantage here is that we're not doing $a^b$ we're doing $a^b \mod c$. So we can use [Fast Modular Exponentiation](https://en.wikipedia.org/wiki/Modular_exponentiation#Left-to-right_binary_method) to reduce the memory consumption since, it is guaranteed that for any value of $a, b, c$ the result &lt;c. Thus we can afford to use even `Int32` to store the result of $a^b \mod c$ for very large values of $a^b$ as long as $c < 2^{32}$.