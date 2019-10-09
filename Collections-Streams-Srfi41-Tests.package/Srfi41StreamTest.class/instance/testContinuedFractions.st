tests
testContinuedFractions
	self
		assert: (self classicContinuedFractionByIteration next: 10)
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
		modulo: #asOrderedCollection