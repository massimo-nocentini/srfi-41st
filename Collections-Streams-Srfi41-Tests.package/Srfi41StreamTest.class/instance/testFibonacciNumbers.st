tests
testFibonacciNumbers
	self
		assert: (Srfi41NumbersSequence fibonacciCorecursive next: 10)
		equals: #(0 1 1 2 3 5 8 13 21 34)
		modulo: #asOrderedCollection