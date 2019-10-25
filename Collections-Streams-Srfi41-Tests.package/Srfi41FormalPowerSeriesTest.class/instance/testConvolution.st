tests
testConvolution
	self
		assert: 1 srfi41Repeat asFPS * 1 srfi41Repeat asFPS
		equals: Srfi41NumbersSequence naturalsCorecursive cdr asFPS
		upto: 30
		modulo: #asOrderedCollection