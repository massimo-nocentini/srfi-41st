tests
testReciprocal
	self
		assert: (1 srfi41Repeat asFPSof: #t) reciprocal
		equals: ({1 . -1} asSrfi41Stream asFPSof: #t)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: ({1 . -1} asSrfi41Stream asFPSof: #t) reciprocal
		equals: (1 srfi41Repeat asFPSof: #t)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 - self t) reciprocal
		equals: (1 srfi41Repeat asFPSof: #t)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: ({1 . -1} asSrfi41Stream asFPSof: #t) * (1 srfi41Repeat asFPSof: #t)
		equals: (1 asFPSof: #t)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 - self t) reciprocal ** 2
		equals: (1 srfi41CountForward asFPSof: #t)
		upto: 30
		modulo: #asOrderedCollection