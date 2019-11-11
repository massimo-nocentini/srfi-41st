tests
testAdd
	self
		assert: (1 srfi41Repeat asFPSof: self t) + (2 asFPSof: self t)
		equals: (([ 3 ] srfi41Cons: [ 1 srfi41Repeat ]) asFPSof: self t)
		upto: 30
		modulo: #asOrderedCollection