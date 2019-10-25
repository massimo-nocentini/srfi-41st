as yet unclassified
reciprocal
	^ [ self stream
		ifNotNil: [ :s | 
			| R carReciprocal |
			carReciprocal := s car reciprocal.
			R := nil.
			R := [ carReciprocal ]
				srfi41Cons: [ (s cdr asFPS * R asFPS * carReciprocal negated asFPS) stream ] ] ]
		srfi41Stream asFPS