tests
testReverse
	(1 to: 10)
		in: [ :interval | 
			self
				assert: (interval asSrfi41Stream reverse)
				equals: (interval reverse)
				modulo: #asOrderedCollection.
		 ]