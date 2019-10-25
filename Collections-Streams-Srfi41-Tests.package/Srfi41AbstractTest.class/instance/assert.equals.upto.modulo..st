tests
assert: actual equals: expected upto: n modulo: aSelector
	"I'm an helper of #assert:equals: that comsume two collections (not strictly eager ones) and
	check if they are the same with respect to conversion given by `aSelector`."

	self
		assert: (aSelector value: (actual stream next: n))
		equals: (aSelector value: (expected stream next: n))