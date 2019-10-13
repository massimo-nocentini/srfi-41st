tests
testConcat
	30
		in: [ :n | 
			| streamOfStreams |
			streamOfStreams := ((OrderedCollection
				with: (1 to: n / 3)
				with: (n / 3 + 1 to: 2 / 3 * n)
				with: (2 / 3 * n + 1 to: n)) collect: #asSrfi41Stream)
				asSrfi41Stream.
			self
				assert: streamOfStreams concat
				equals: (1 to: n)
				modulo: #asOrderedCollection.
		
			 ]