tests
testPrimeGaps
	500
		in: [ :n | 
			| primes |
			primes := Srfi41NumbersSequence primesEratosthenes.
			self
				assert: ((primes cdr zip: primes with: #-) next: n) asOrderedCollection asBag
				equals:
					{(1 -> 1).
					(2 -> 96).
					(4 -> 98).
					(6 -> 120).
					(8 -> 46).
					(10 -> 47).
					(12 -> 37).
					(14 -> 18).
					(16 -> 11).
					(18 -> 9).
					(20 -> 4).
					(22 -> 6).
					(24 -> 2).
					(26 -> 2).
					(28 -> 2).
					(34 -> 1)}
				modulo: #asDictionary ]