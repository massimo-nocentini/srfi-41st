tests
testCollatz
	self
		assert: (100 srfi41Collatz next: 30)
		equals:
			#(100 50 25 76 38 19 58 29 88 44 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1 4 2 1 4)
		modulo: #asOrderedCollection