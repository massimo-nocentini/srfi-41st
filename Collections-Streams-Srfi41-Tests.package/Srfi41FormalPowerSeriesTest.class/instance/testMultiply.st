tests
testMultiply
	| nats |
	nats := Srfi41NumbersSequence naturalsCorecursive.
	self
		assert: (2 asFPSof: self t var) * (nats asFPSof: self t var)
		equals: ((nats collect: #double) asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (nats asFPSof: self t var) * (2 asFPSof: self t var)
		equals: ((nats collect: #double) asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection