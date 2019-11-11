tests
testArctan
	| t tan |
	t := #t asFPS.
	tan := (1 + (t ** 2)) reciprocal integral revert.
	self
		assert: t sin / t cos - tan
		equals: 0 asFPS
		upto: 30
		modulo: #asOrderedCollection