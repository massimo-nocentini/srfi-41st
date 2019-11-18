tests
testShift
	self
		assert: (1 asFPSof: self t var) >> 3
		equals: self t ** 3
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: self t >> 3
		equals: self t ** 4
		upto: 30
		modulo: #asOrderedCollection