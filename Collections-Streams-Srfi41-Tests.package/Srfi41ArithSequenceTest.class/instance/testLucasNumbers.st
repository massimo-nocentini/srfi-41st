tests
testLucasNumbers
	self
		assert: (Srfi41NumbersSequence lucasCorecursive next: 10)
		equals: #(2 1 3 4 7 11 18 29 47 76)
		modulo: #asOrderedCollection