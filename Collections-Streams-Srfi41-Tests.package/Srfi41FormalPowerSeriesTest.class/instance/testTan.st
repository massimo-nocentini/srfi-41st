tests
testTan
	self
		assert: self t tan
		equals:
			({0.
			1.
			0.
			(1 / 3).
			0.
			(2 / 15).
			0.
			(17 / 315).
			0.
			(62 / 2835).
			0.
			(1382 / 155925).
			0.
			(21844 / 6081075).
			0} asSrfi41Stream asFPSof: self t var)
		upto: 15
		modulo: #asOrderedCollection