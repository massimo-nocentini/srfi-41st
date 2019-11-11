tests
testEmptyStream
	self
		assert: ({} asSrfi41Stream asFPSof: self t)
		equals: (0 asFPSof: self t)
		upto: 30
		modulo: #asOrderedCollection