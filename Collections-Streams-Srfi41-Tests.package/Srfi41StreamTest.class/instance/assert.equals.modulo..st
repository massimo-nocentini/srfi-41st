tests
assert: actual equals: expected modulo: aSelector
	self
		assert: (aSelector value: actual)
		equals: (aSelector value: expected)