tests
testMinus 
	self
		assert: 3 asFPS - 4 asFPS
		equals: -1 asFPS
		upto: 30
		modulo: #asOrderedCollection