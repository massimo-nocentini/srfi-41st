tests
testNQueens
	8
		in: [ :n | 
			self
				assert: ((Srfi41NQueens new queens: n) collect: #asOrderedCollection  )

				equals: #()
				modulo: #asOrderedCollection ]