tests
testNaturals
	10
		in: [ :n | 
			self
				assert: (iterativeNats next: n)
				equals: (0 to: n - 1)
				modulo: #asOrderedCollection.
			self
				assert: (corecursiveNats next: n)
				equals: (0 to: n - 1)
				modulo: #asOrderedCollection ]