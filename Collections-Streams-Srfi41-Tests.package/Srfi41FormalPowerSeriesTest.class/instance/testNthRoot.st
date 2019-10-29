tests
testNthRoot
	self
		assert: (1 asFPS - (#t asFPS cos ** 2)) sqrt
		equals: #t asFPS sin
		upto: 30
		modulo: #asOrderedCollection