tests
testAdd
	self
		assert: (1 srfi41Repeat asFPSof: self t var) + (2 asFPSof: self t var)
		equals: (([ 3 ] srfi41Cons: [ 1 srfi41Repeat ]) asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection