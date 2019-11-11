tests
testArctan
	| tan |
	tan := (1 + (self t ** 2)) reciprocal integral revert.
	self
		assert: self t sin / self t cos - tan
		equals: (0 asFPSof: self t)
		upto: 30
		modulo: #asOrderedCollection