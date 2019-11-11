tests
testMinus
	self
		assert: (3 asFPSof: self t) - (4 asFPSof: self t)
		equals: (-1 asFPSof: self t)
		upto: 30
		modulo: #asOrderedCollection