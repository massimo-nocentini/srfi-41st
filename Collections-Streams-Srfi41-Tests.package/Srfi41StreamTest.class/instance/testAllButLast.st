tests
testAllButLast
	self
		assert: {} asSrfi41Stream allButLast
		equals: OrderedCollection new allButLast
		modulo: #asOrderedCollection.
	(1 to: 10)
		in: [ :interval | 
			self
				assert: interval asSrfi41Stream allButLast
				equals: interval allButLast
				modulo: #asOrderedCollection ]