as yet unclassified
reciprocal
	^ [ | R carReciprocal |
	carReciprocal := self stream car reciprocal.
	R := nil.
	R := [ carReciprocal ]
		srfi41ConsFPS: [ self stream cdr asFPS * R * carReciprocal negated asFPS ].
	R stream ] srfi41Stream asFPS