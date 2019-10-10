tests
testRationalNumbers
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