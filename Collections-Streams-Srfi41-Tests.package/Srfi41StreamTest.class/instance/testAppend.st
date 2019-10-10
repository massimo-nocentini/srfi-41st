tests
testAppend
	20
		in: [ :n | 
			| split |
			split := (n / 2) floor.
			self
				assert: (1 to: split) asSrfi41Stream , (split + 1 to: n) asSrfi41Stream
				equals: (1 to: n)
				modulo: #asOrderedCollection ]