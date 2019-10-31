*Collections-Streams-Srfi41-ArithSequences
piWithPrimesSrfi41Stream: primes
	^ (primes nextWhile: [ :aPrime | aPrime <= self ]) size