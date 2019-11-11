tests
testNegated
	self
		assert: (1 srfi41Repeat asFPSof: self t) negated
		equals: (-1 srfi41Repeat asFPSof: self t)
		upto: 30
		modulo: #asOrderedCollection