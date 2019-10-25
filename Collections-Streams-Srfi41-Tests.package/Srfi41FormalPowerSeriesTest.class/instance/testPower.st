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
		assert: 1 srfi41Repeat asFPS ** 4
		equals: Srfi41NumbersSequence triangulars cdr asFPS
		upto: 30
		modulo: #asOrderedCollection