tests
testNextEvery
	20
		in: [ :n | 
			self
				assert: ((0 srfi41CountForward nextEvery: 2) next: n)
				equals: (0 to: 2 * (n - 1) by: 2)
				modulo: #asOrderedCollection.
			self
				assert: (((1 to: 10) asSrfi41Stream nextEvery: 3) next: n)
				equals: {1 . 4 . 7 . 10}
				modulo: #asOrderedCollection ]