tests
testPower
	self
		assert: 1 srfi41Repeat asFPS ** 2
		equals: Srfi41NumbersSequence naturalsCorecursive cdr asFPS
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: 1 srfi41Repeat asFPS ** 3
		equals: Srfi41NumbersSequence triangulars cdr asFPS
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 asFPS - #t asFPS) ** 2
		equals: {1 . -2 . 1} asFPS
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 asFPS - (2 asFPS * (#t asFPS ** 2))) ** 3
		equals: {1 . 0 . -6 . 0 . 12 . 0 . -8} asFPS
		upto: 30
		modulo: #asOrderedCollection