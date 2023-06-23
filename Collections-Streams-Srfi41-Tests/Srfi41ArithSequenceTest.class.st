Class {
	#name : #Srfi41ArithSequenceTest,
	#superclass : #Srfi41AbstractTest,
	#instVars : [
		'iterativeNats',
		'corecursiveNats'
	],
	#category : 'Collections-Streams-Srfi41-Tests'
}

{ #category : #running }
Srfi41ArithSequenceTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	corecursiveNats := Srfi41NumbersSequence naturalsCorecursive.
	iterativeNats := Srfi41NumbersSequence naturalsIterative
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testCollatz [
	self
		assert: (100 srfi41Collatz next: 30)
		equals:
			#(100 50 25 76 38 19 58 29 88 44 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1 4 2 1 4)
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testContinuedFractions [
	self
		assert: (1 srfi41UniformContinuedFraction next: 10)
		equals:
			{1.
			2.
			(3 / 2).
			(5 / 3).
			(8 / 5).
			(13 / 8).
			(21 / 13).
			(34 / 21).
			(55 / 34).
			(89 / 55)}
		modulo: #asOrderedCollection.
	self
		assert: (2 srfi41UniformContinuedFraction next: 10)
		equals:
			{1.
			3.
			(7 / 3).
			(17 / 7).
			(41 / 17).
			(99 / 41).
			(239 / 99).
			(577 / 239).
			(1393 / 577).
			(3363 / 1393)}
		modulo: #asOrderedCollection.
	self
		assert: (3 srfi41UniformContinuedFraction next: 10)
		equals:
			{1.
			4.
			(13 / 4).
			(43 / 13).
			(142 / 43).
			(469 / 142).
			(1549 / 469).
			(5116 / 1549).
			(16897 / 5116).
			(55807 / 16897)}
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testCounting [
	0 -> 30
		in: [ :assoc | 
			| start nel |
			start := assoc key.
			nel := assoc value.
			self
				assert: (start srfi41CountForward next: nel)
				equals: (start to: nel - 1)
				modulo: #asOrderedCollection ].
	30 -> 1
		in: [ :assoc | 
			| start end |
			start := assoc key.
			end := assoc value.
			self
				assert: (start srfi41CountBackward next: start)
				equals: (start to: end by: -1)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testEvenNumbers [
	10
		in: [ :n | 
			self
				assert:
					((iterativeNats zip: corecursiveNats with: #+)
						next: n)
				equals: (0 to: 2 * (n - 1) by: 2)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testFactorialNumbers [
	30
		in: [ :n | 
			self
				assert: (Srfi41NumbersSequence factorials next: n)
				equals:
					#(1 1 2 6 24 120 720 5040 40320 362880 3628800 39916800 479001600 6227020800 87178291200 1307674368000 20922789888000 355687428096000 6402373705728000 121645100408832000 2432902008176640000 51090942171709440000 1124000727777607680000 25852016738884976640000 620448401733239439360000 15511210043330985984000000 403291461126605635584000000 10888869450418352160768000000 304888344611713860501504000000 8841761993739701954543616000000)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testFibonacciNumbers [
	self
		assert: (Srfi41NumbersSequence fibonacciCorecursive next: 10)
		equals: #(0 1 1 2 3 5 8 13 21 34)
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testGrayCodes [
	6
		in: [ :n | 
			self
				assert: (Srfi41NumbersSequence binaryReflectedGrayCodes next: n)
				equals:
					(OrderedCollection new
						add: #(#());
						add: #(#(0) #(1));
						add: #(#(0 0) #(0 1) #(1 1) #(1 0));
						add:
							#(#(0 0 0) #(0 0 1) #(0 1 1) #(0 1 0) #(1 1 0) #(1 1 1) #(1 0 1) #(1 0 0));
						add:
							#(#(0 0 0 0) #(0 0 0 1) #(0 0 1 1) #(0 0 1 0) #(0 1 1 0) #(0 1 1 1) #(0 1 0 1) #(0 1 0 0) #(1 1 0 0) #(1 1 0 1) #(1 1 1 1) #(1 1 1 0) #(1 0 1 0) #(1 0 1 1) #(1 0 0 1) #(1 0 0 0));
						add:
							#(#(0 0 0 0 0) #(0 0 0 0 1) #(0 0 0 1 1) #(0 0 0 1 0) #(0 0 1 1 0) #(0 0 1 1 1) #(0 0 1 0 1) #(0 0 1 0 0) #(0 1 1 0 0) #(0 1 1 0 1) #(0 1 1 1 1) #(0 1 1 1 0) #(0 1 0 1 0) #(0 1 0 1 1) #(0 1 0 0 1) #(0 1 0 0 0) #(1 1 0 0 0) #(1 1 0 0 1) #(1 1 0 1 1) #(1 1 0 1 0) #(1 1 1 1 0) #(1 1 1 1 1) #(1 1 1 0 1) #(1 1 1 0 0) #(1 0 1 0 0) #(1 0 1 0 1) #(1 0 1 1 1) #(1 0 1 1 0) #(1 0 0 1 0) #(1 0 0 1 1) #(1 0 0 0 1) #(1 0 0 0 0));
						yourself)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testHamming [
	30
		in: [ :n | 
			self
				assert: (Srfi41NumbersSequence hamming next: n)
				equals:
					#(1 2 3 4 5 6 8 9 10 12 15 16 18 20 24 25 27 30 32 36 40 45 48 50 54 60 64 72 75 80)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testLucasNumbers [
	self
		assert: (Srfi41NumbersSequence lucasCorecursive next: 10)
		equals: #(2 1 3 4 7 11 18 29 47 76)
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testNaturalNumbers [
	(0 to: 9)
		in: [ :interval | 
			self
				assert: (iterativeNats next: interval size)
				equals: interval
				modulo: #asOrderedCollection.
			self
				assert: (corecursiveNats next: interval size)
				equals: interval
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testNthRootsOfUnity [

	10 in: [ :n | 
		self assert:
			((Srfi41NumbersSequence nthRootsOfUnity collect: [ :roots | 
				  (roots collect: #abs) allSatisfy: [ :each | each closeTo: 1 ] ]) 
				 next: n) and ].
	3 in: [ :n | 
		self
			assert: (Srfi41NumbersSequence nthRootsOfUnity next: n)
			equals: { 
					(Array with: 1 + 0 i).
					(Array with: 1 + 0 i with: -1.0 + 1.2246467991473532e-16 i).
					(Array
						 with: 1 + 0 i
						 with: -0.4999999999999998 + 0.8660254037844388 i
						 with: -0.5000000000000006 - 0.8660254037844385 i) }
			modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testPi [
	| primes |
	primes := Srfi41NumbersSequence primesEratosthenes.
	self
		assert: ((2 to: 500) collect: [ :n | n piWithPrimesSrfi41Stream: primes ])
		equals:
			#(1 2 2 3 3 4 4 4 4 5 5 6 6 6 6 7 7 8 8 8 8 9 9 9 9 9 9 10 10 11 11 11 11 11 11 12 12 12 12 13 13 14 14 14 14 15 15 15 15 15 15 16 16 16 16 16 16 17 17 18 18 18 18 18 18 19 19 19 19 20 20 21 21 21 21 21 21 22 22 22 22 23 23 23 23 23 23 24 24 24 24 24 24 24 24 25 25 25 25 26 26 27 27 27 27 28 28 29 29 29 29 30 30 30 30 30 30 30 30 30 30 30 30 30 30 31 31 31 31 32 32 32 32 32 32 33 33 34 34 34 34 34 34 34 34 34 34 35 35 36 36 36 36 36 36 37 37 37 37 37 37 38 38 38 38 39 39 39 39 39 39 40 40 40 40 40 40 41 41 42 42 42 42 42 42 42 42 42 42 43 43 44 44 44 44 45 45 46 46 46 46 46 46 46 46 46 46 46 46 47 47 47 47 47 47 47 47 47 47 47 47 48 48 48 48 49 49 50 50 50 50 51 51 51 51 51 51 52 52 53 53 53 53 53 53 53 53 53 53 54 54 54 54 54 54 55 55 55 55 55 55 56 56 56 56 56 56 57 57 58 58 58 58 58 58 59 59 59 59 60 60 61 61 61 61 61 61 61 61 61 61 62 62 62 62 62 62 62 62 62 62 62 62 62 62 63 63 63 63 64 64 65 65 65 65 66 66 66 66 66 66 66 66 66 66 66 66 66 66 67 67 67 67 67 67 68 68 68 68 68 68 68 68 68 68 69 69 70 70 70 70 71 71 71 71 71 71 72 72 72 72 72 72 72 72 73 73 73 73 73 73 74 74 74 74 74 74 75 75 75 75 76 76 76 76 76 76 77 77 77 77 77 77 77 77 78 78 78 78 79 79 79 79 79 79 79 79 80 80 80 80 80 80 80 80 80 80 81 81 82 82 82 82 82 82 82 82 82 82 83 83 84 84 84 84 84 84 85 85 85 85 86 86 86 86 86 86 87 87 87 87 87 87 87 87 88 88 88 88 89 89 90 90 90 90 91 91 91 91 91 91 91 91 91 91 91 91 92 92 92 92 92 92 92 92 93 93 93 93 94 94 94 94 94 94 94 94 95 95)
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testPrimeGaps [
	500
		in: [ :n | 
			| primes bag |
			primes := Srfi41NumbersSequence primesEratosthenes.
			bag := Bag new.
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
				do: [ :assoc | bag add: assoc key withOccurrences: assoc value ].
			self
				assert: ((primes cdr zip: primes with: #-) next: n) asOrderedCollection asBag
				equals: bag ]
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testPrimeNumbers [
	50
		in: [ :n | 
			| probablyPrimes |
			probablyPrimes := #(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199 211 223 227 229).
			self assert: (probablyPrimes allSatisfy: #isPrime).	"now they deserve to be primes!"
			self
				assert: (Srfi41NumbersSequence primesReade next: n)
				equals: probablyPrimes
				modulo: #asOrderedCollection.
			self
				assert: (Srfi41NumbersSequence primesEratosthenes next: n)
				equals: probablyPrimes
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testPrimesScan [
	50
		in: [ :n | 
			self
				assert: ((Srfi41NumbersSequence primesEratosthenes scan1: #+) next: n)
				equals:
					#(2 5 10 17 28 41 58 77 100 129 160 197 238 281 328 381 440 501 568 639 712 791 874 963 1060 1161 1264 1371 1480 1593 1720 1851 1988 2127 2276 2427 2584 2747 2914 3087 3266 3447 3638 3831 4028 4227 4438 4661 4888 5117)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testRandomNumbers [
	10
		in: [ :n | 
			self
				assert: (100 srfi41ParkMiller next: n)
				equals:
					#(1680700 2477721124 3350996348 289468388 3192218044 3172171172 1251842556 2968022884 1810435644 2443543844)
				modulo: #asOrderedCollection.
			self
				assert: (Srfi41NumbersSequence random next: n)
				equals:
					#(0.13153778814316625
0.7556053221950332
0.4586501319234493
0.5327672374121692
0.21895918632809036
0.04704461621448613
0.678864716868319
0.6792964058366122
0.9346928959408276
0.3835020774898595)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testRationalNumbers [
	self
		assert: (0 srfi41RationalsWithoutDuplicates next: 20)
		equals:
			{0.
			1.
			(1 / 2).
			2.
			(1 / 3).
			(3 / 2).
			(2 / 3).
			3.
			(1 / 4).
			(4 / 3).
			(3 / 5).
			(5 / 2).
			(2 / 5).
			(5 / 3).
			(3 / 4).
			4.
			(1 / 5).
			(5 / 4).
			(4 / 7).
			(7 / 3)}
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testSrfi41Iter [
	self
		assert: (([ :n | n increase ] srfi41Iter value: 0) next: 20)
		equals: #(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19)
		modulo: #asOrderedCollection.
	self
		assert: (([ :n | n double ] srfi41Iter value: 1) next: 8)
		equals: #(1 2 4 8 16 32 64 128)
		modulo: #asOrderedCollection.
	self
		assert: (([ :n | n squared ] srfi41Iter value: 2) next: 8)
		equals:
			#(2 4 16 256 65536 4294967296 18446744073709551616 340282366920938463463374607431768211456)
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41ArithSequenceTest >> testTriangularNumbers [
	30
		in: [ :n | 
			self
				assert: (Srfi41NumbersSequence triangulars next: n)
				equals:
					#(0 1 3 6 10 15 21 28 36 45 55 66 78 91 105 120 136 153 171 190 210 231 253 276 300 325 351 378 406 435)
				modulo: #asOrderedCollection ]
]
