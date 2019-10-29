tests
testPascal
	self
		assert: (1 asFPS - ((1 asFPS + #x asFPS) * #y asFPS)) reciprocal
		equals: #(1 1 2 3 5 8 13 21 34 55 89 144 233 377 610) asFPS
		upto: 15
		modulo: #asOrderedCollection