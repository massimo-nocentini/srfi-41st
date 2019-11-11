as yet unclassified
nthRoot: n
	^ [ self car = 1
		ifTrue: [ | R |
			R := nil.
			R := [ 1 + (self derivative / (n * (R ** (n - 1)))) integral ]
				srfi41StreamFPSof: self var ]
		ifFalse: [ (self car isZero and: [ self cdr car isZero ])
				ifTrue: [ [ 0 ] srfi41ConsFPS: [ self cdr cdr nthRoot: n ] of: self var ]
				ifFalse: [ Error signal ] ] ] srfi41StreamFPSof: self var