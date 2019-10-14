tests
testFlatCollect
	(1 to: 10)
		in: [ :interval | 
			self
				assert:
					(interval asSrfi41Stream
						flatCollect: [ :each | (1 to: each) asSrfi41Stream collect: #reciprocal ])
				equals:
					(interval flatCollect: [ :each | (1 to: each) collect: #reciprocal ])
				modulo: #asOrderedCollection ]