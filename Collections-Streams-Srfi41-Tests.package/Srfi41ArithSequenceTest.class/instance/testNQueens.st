tests
testNQueens
	self
		assert: ((1 to: 8) collect: [ :n | (Srfi41NQueens new queens: n) size ])
		equals: #(1 0 0 2 10 4 40 92)