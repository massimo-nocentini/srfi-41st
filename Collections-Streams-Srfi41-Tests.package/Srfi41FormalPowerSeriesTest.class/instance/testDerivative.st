tests
testDerivative
	self
		assert: (1 - self t) reciprocal derivative
		equals: ((1 - self t) ** 2) reciprocal
		upto: 15
		modulo: #asOrderedCollection