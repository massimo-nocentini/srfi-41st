tests
testMultiply
	| nats |
	nats := Srfi41NumbersSequence naturalsCorecursive.
	self
		assert: nats asFPS * 2 asFPS
		equals: (nats collect: #double) asFPS
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: 2 asFPS * nats asFPS
		equals: (nats collect: #double) asFPS
		upto: 30
		modulo: #asOrderedCollection