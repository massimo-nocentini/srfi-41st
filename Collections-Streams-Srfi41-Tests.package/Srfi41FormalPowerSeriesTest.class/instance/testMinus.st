tests
testMinus
	self
		assert: (3 asFPSof: self t var) - (4 asFPSof: self t var)
		equals: (-1 asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection