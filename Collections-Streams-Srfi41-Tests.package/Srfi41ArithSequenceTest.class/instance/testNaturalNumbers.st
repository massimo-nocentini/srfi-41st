tests
testNaturalNumbers
	(0 to: 9)
		in: [ :interval | 
			self
				assert: (iterativeNats next: interval size)
				equals: interval
				modulo: #asOrderedCollection.
			self
				assert: (corecursiveNats next: interval size)
				equals: interval
				modulo: #asOrderedCollection ]