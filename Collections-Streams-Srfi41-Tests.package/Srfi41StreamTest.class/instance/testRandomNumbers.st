tests
testRandomNumbers
	10
		in: [ :n | 
			self
				assert: (100 srfi41ParkMiller cdr next: n)
				equals:
					#(1680700 2477721124 3350996348 289468388 3192218044 3172171172 1251842556 2968022884 1810435644 2443543844)
				modulo: #asOrderedCollection ]