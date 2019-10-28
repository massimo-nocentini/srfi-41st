as yet unclassified
reciprocal
	^ [ | R carReciprocal |
	carReciprocal := self stream car reciprocal.
	R := nil.
	R := [ carReciprocal ]
		srfi41Cons: [ (self stream cdr asFPS * R asFPS * carReciprocal negated asFPS)
				stream ] ] srfi41Stream asFPS