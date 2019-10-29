tests
testShift
	self
		assert: 1 asFPS >> 3
		equals: #t asFPS ** 3
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: #t asFPS >> 3
		equals: #t asFPS ** 4
		upto: 30
		modulo: #asOrderedCollection