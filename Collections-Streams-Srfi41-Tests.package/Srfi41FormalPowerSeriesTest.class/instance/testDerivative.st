tests
testDerivative
	self
		assert: (1 asFPS - #t asFPS) reciprocal derivative
		equals: ((1 asFPS - #t asFPS) ** 2) reciprocal
		upto: 15
		modulo: #asOrderedCollection