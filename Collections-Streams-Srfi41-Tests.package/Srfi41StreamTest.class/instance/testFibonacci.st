tests
testFibonacci
	self
		assert: (0 srfi41FibonacciNumbers next: 10) asOrderedCollection
		equals: #(0 1 1 2 3 5 8 13 21 34) asOrderedCollection