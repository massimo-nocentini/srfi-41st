tests
test8Queens
	8
		in: [ :n | 
			| solutions |
			solutions := Srfi41NQueens new queens: n.
			self
				assert: (solutions next: 5)
				equals:
					#(#(1 5 8 6 3 7 2 4) #(1 6 8 3 7 4 2 5) #(1 7 4 6 8 2 5 3) #(1 7 5 8 2 4 6 3) #(2 4 6 8 3 1 7 5))
				modulo: #asOrderedCollection.
			self assert: solutions size equals: 92 ]