tests
testEvenNumbers
	10
		in: [ :n | 
			self
				assert:
					((iterativeNats zip: corecursiveNats with: #+)
						next: n)
				equals: (0 to: 2 * (n - 1) by: 2)
				modulo: #asOrderedCollection ]