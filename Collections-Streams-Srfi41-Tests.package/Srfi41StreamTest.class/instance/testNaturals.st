tests
testNaturals
	10
		in: [ :n | 
			self
				assert: (self naturalByIterationNumbers next: n) asOrderedCollection
				equals: (0 to: n - 1) asOrderedCollection.
			self
				assert: (self naturalByZipNumbers next: n) asOrderedCollection
				equals: (0 to: n - 1) asOrderedCollection ]