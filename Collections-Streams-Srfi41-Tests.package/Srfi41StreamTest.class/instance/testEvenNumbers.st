tests
testEvenNumbers
	10
		in: [ :n | 
			self
				assert:
					((self naturalByIterationNumbers
						zip: self naturalByZipNumbers
						with: [ :a :aa | a + aa ]) next: n) asOrderedCollection
				equals: (0 to: 2 * (n - 1) by: 2) asOrderedCollection ]