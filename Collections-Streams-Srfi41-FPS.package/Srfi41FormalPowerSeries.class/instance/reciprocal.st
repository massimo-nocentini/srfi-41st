as yet unclassified
reciprocal
	^ [ | R carReciprocal |
	carReciprocal := self car reciprocal.
	R := nil.
	R := [ carReciprocal ]
		srfi41ConsFPS: [ carReciprocal negated asFPS * R * self cdr ] ]
		srfi41StreamFPS