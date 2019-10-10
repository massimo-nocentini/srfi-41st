tests
testContinuedFractions
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
(13/4).
(43/13).
(142/43).
(469/142).
(1549/469).
(5116/1549).
(16897/5116).
(55807/16897)}
		modulo: #asOrderedCollection