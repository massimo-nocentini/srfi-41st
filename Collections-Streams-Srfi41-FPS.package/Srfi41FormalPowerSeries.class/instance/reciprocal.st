as yet unclassified
reciprocal
	"reciprocal
	^ [ | R carReciprocal |
	carReciprocal := self car reciprocal.
	R := nil.
	R := (1 asFPS - [ (self cdr >> 1) * R ] srfi41StreamFPS)
		* carReciprocal asFPS ] srfi41StreamFPS"

	^ [ | R carReciprocal |
	carReciprocal := self car reciprocal.
	R := nil.
	R := [ carReciprocal ]
		srfi41ConsFPS: [ carReciprocal negated asFPS * R * self cdr ] ]
		srfi41StreamFPS