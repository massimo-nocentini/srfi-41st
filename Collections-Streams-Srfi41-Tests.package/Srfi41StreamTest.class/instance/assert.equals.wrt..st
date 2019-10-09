tests
assert: actual equals: expected wrt: aSelector
	self assert: (aSelector value: actual) equals: (aSelector value: expected )  