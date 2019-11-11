tests
testConvolution
	| ones |
	ones := 1 srfi41Repeat asFPSof: self t.
	self
		assert: ones * ones
		equals: (Srfi41NumbersSequence naturalsCorecursive cdr asFPSof: self t)
		upto: 30
		modulo: #asOrderedCollection