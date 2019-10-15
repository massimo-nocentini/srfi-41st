tests
testScan
	20
		in: [ :n | 
			self
				assert: (([ 1 ] srfi41Repeat scan: #+ init: 0) next: n)
				equals: (0 to: n - 1)
				modulo: #asOrderedCollection ]