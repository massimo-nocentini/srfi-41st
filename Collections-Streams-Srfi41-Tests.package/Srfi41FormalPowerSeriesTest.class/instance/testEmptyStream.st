tests
testEmptyStream
	self
		assert: ({} asSrfi41Stream asFPSof: self t var)
		equals: (0 asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection