tests
testPower
	self
		assert: (1 srfi41Repeat asFPSof: self t) ** 2
		equals: (Srfi41NumbersSequence naturalsCorecursive cdr asFPSof: self t)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 srfi41Repeat asFPSof: self t) ** 3
		equals: (Srfi41NumbersSequence triangulars cdr asFPSof: self t)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 - self t) ** 2
		equals: ({1 . -2 . 1} asSrfi41Stream asFPSof: self t)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 - (2 * (self t ** 2))) ** 3
		equals: ({1 . 0 . -6 . 0 . 12 . 0 . -8} asSrfi41Stream asFPSof: self t)
		upto: 30
		modulo: #asOrderedCollection