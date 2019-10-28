tests
testReciprocal
	self
		assert: 1 srfi41Repeat asFPS reciprocal
		equals: {1 . -1} asFPS
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: {1 . -1} asFPS reciprocal
		equals: 1 srfi41Repeat asFPS
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 asFPS - #t asFPS) reciprocal
		equals: 1 srfi41Repeat asFPS
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: {1 . -1} asFPS * 1 srfi41Repeat asFPS
		equals: 1 asFPS
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 asFPS - #t asFPS) reciprocal ** 2
		equals: 1 srfi41CountForward asFPS
		upto: 30
		modulo: #asOrderedCollection