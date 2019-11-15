tests
testAt
	self
		assert: (({1 . 2 . 1} asSrfi41Stream asPolynomialOf: self t var) atStrict: 1)
		equals: 4.
	self
		assert: (({1 . 2 . 1} asSrfi41Stream asPolynomialOf: self t var) atStrict: 2)
		equals: 9.
	self
		assert: (({1 . 2 . 3} asSrfi41Stream asPolynomialOf: self t var) atStrict: 2)
		equals: 17.
	self
		assert: ((1 + (2 * self t) + (self t ** 2) at: 1) next: 10)
		equals: ({1 . 3} asSrfi41Stream , 4 srfi41Repeat next: 10)
		modulo: #asOrderedCollection.
	self
		assert: (((1 - self t) reciprocal at: 1) next: 10)
		equals: (1 to: 10)
		modulo: #asOrderedCollection