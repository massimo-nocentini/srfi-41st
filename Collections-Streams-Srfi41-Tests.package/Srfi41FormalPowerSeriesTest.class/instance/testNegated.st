tests
testNegated
	self
		assert: (1 srfi41Repeat asFPSof: self t var) negated
		equals: (-1 srfi41Repeat asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection