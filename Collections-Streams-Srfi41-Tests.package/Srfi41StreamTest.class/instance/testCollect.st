tests
testCollect
	(1 to: 10)
		in: [ :interval | 
			self
				assert: (interval asSrfi41Stream collect: #squared)
				equals: (interval collect: #squared)
				modulo: #asOrderedCollection.
			self
				assert: ((1 srfi41CountForward collect: #squared) next: interval size)
				equals:(interval collect: #squared)
				modulo: #asOrderedCollection ]