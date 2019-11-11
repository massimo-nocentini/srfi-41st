tests
testEvalAt
	| t |
	t := #t asFPS.
	self
		assert: ((1 + (2 * t) + (t ** 2) evalAt: 1) next: 10)
		equals: ({1 . 3} asSrfi41Stream , 4 srfi41Repeat next: 10)
		modulo: #asOrderedCollection.
	self
		assert: (((1 - #t asFPS) reciprocal evalAt: 1) next: 10)
		equals: (1 to: 10)
		modulo: #asOrderedCollection