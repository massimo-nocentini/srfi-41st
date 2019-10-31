tests
testSrfi41Iter
	self
		assert: (([ :n | n increase ] srfi41Iter value: 0) next: 20)
		equals: #(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19)
		modulo: #asOrderedCollection.
	self
		assert: (([ :n | n double ] srfi41Iter value: 1) next: 8)
		equals: #(1 2 4 8 16 32 64 128)
		modulo: #asOrderedCollection.
	self
		assert: (([ :n | n squared ] srfi41Iter value: 2) next: 8)
		equals:
			#(2 4 16 256 65536 4294967296 18446744073709551616 340282366920938463463374607431768211456)
		modulo: #asOrderedCollection