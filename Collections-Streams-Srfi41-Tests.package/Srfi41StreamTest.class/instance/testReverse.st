tests
testReverse
	(1 to: 10)
		in: [ :interval | 
			self
				assert: interval asSrfi41Stream reverse
				equals: interval reverse
				modulo: #asOrderedCollection ].
	(-5 to: 5)
		in: [ :interval | 
			self
				assert: (interval asSrfi41Stream collect: #reciprocal) reverse size
				equals: interval size
				modulo: #asOrderedCollection ]