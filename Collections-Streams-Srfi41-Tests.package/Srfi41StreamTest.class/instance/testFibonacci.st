tests
testFibonacci
	self
		assert: (self fibonacciNumbers next: 10) asOrderedCollection 
		equals: #(0 1 1 2 3 5 8 13 21 34) asOrderedCollection