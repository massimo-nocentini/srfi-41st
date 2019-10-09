tests
testAppend
	20
		in: [ :n | 
			self
				assert: (1 to: 10) asSrfi41Stream , (11 to: n) asSrfi41Stream
				equals: (1 to: n)
				modulo: #asOrderedCollection ]