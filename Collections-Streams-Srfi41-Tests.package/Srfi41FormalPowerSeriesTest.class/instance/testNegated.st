tests
testNegated
	self
		assert: 1 srfi41Repeat asFPS negated
		equals: -1 srfi41Repeat asFPS
		upto: 30
		modulo: #asOrderedCollection