tests
testCos
	self
		assert: self t cos
		equals:
			({1.
			0.
			(-1 / 2).
			0.
			(1 / 24).
			0.
			(-1 / 720).
			0.
			(1 / 40320).
			0.
			(-1 / 3628800).
			0.
			(1 / 479001600).
			0.
			(-1 / 87178291200)} asSrfi41Stream asFPSof: self t)
		upto: 15
		modulo: #asOrderedCollection