tests
testNaturals
	10
		in: [ :n | 
			self
				assert: (self naturalByIterationNumbers next: n) 
				equals: (0 to: n - 1) 
				modulo: #asOrderedCollection.
			self
				assert: (self naturalByZipNumbers next: n) 
				equals: (0 to: n - 1) 
				modulo: #asOrderedCollection ]