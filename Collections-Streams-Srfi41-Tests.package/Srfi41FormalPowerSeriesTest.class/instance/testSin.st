tests
testSin
	self
		assert: self t sin
		equals:
			({0.
			1.
			0.
			(-1 / 6).
			0.
			(1 / 120).
			0.
			(-1 / 5040).
			0.
			(1 / 362880).
			0.
			(-1 / 39916800).
			0.
			(1 / 6227020800).
			0} asSrfi41Stream asFPSof: self t)
		upto: 15
		modulo: #asOrderedCollection