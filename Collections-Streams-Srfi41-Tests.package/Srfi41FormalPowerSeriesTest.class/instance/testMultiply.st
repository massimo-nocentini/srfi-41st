tests
testMultiply
	| nats |
	nats := Srfi41NumbersSequence naturalsCorecursive.
	self
		assert: (2 asFPSof: #t) * (nats asFPSof: #t)
		equals: ((nats collect: #double) asFPSof: #t)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (nats asFPSof: #t) * (2 asFPSof: #t)
		equals: ((nats collect: #double) asFPSof: #t)
		upto: 30
		modulo: #asOrderedCollection