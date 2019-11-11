tests
testExp
	self
		assert: self t exp
		equals:
			({1.
			1.
			(1 / 2).
			(1 / 6).
			(1 / 24).
			(1 / 120).
			(1 / 720).
			(1 / 5040).
			(1 / 40320).
			(1 / 362880).
			(1 / 3628800).
			(1 / 39916800).
			(1 / 479001600).
			(1 / 6227020800)} asSrfi41Stream asFPSof: self t)
		upto: 14
		modulo: #asOrderedCollection