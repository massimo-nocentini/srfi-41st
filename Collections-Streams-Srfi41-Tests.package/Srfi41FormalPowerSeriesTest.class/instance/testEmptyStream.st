tests
testEmptyStream
	self
		assert: {} asSrfi41Stream asFPS
		equals: 0 asFPS
		upto: 30
		modulo: #asOrderedCollection