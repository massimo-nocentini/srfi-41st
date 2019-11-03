as yet unclassified
reciprocal
	^ [ | R carReciprocal |
	carReciprocal := self car reciprocal.
	R := nil.
	R := [ carReciprocal ]
		srfi41ConsFPS: [ carReciprocal negated * R * self cdr ] ]
		srfi41StreamFPS