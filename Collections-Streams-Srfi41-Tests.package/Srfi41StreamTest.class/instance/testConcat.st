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
			self
				assert: streamOfStreams concatFair
				equals:
					#(1 11 21 2 12 22 3 13 23 4 14 24 5 15 25 6 16 26 7 17 27 8 18 28 9 19 29 10 20 30)
				modulo: #asOrderedCollection.
			 ]