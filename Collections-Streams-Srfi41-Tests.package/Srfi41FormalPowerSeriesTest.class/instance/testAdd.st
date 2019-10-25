tests
testAdd
	self
		assert: 1 srfi41Repeat asFPS + 2 asFPS
		equals: ([ 3 ] srfi41Cons: [ 1 srfi41Repeat ]) asFPS
		upto: 30
		modulo: #asOrderedCollection