tests
testReciprocal
	self
		assert: (1 srfi41Repeat asFPSof: self t var) reciprocal
		equals: ({1 . -1} asSrfi41Stream asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: ({1 . -1} asSrfi41Stream asFPSof: self t var) reciprocal
		equals: (1 srfi41Repeat asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 - self t) reciprocal
		equals: (1 srfi41Repeat asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert:
			({1 . -1} asSrfi41Stream asFPSof: self t var)
				* (1 srfi41Repeat asFPSof: self t var)
		equals: (1 asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 - self t) reciprocal ** 2
		equals: (1 srfi41CountForward asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection