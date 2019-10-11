tests
testConcat
	30
		in: [ :n | 
			| split |
			split := (n / 2) floor.
			self
				assert:
					({(1 to: n / 3).
					(n / 3 + 1 to: 2 / 3 * n).
					(2 / 3 * n + 1 to: n)} collect: #asSrfi41Stream) asSrfi41Stream
						concat
				equals: (1 to: n)
				modulo: #asOrderedCollection ]