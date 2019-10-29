as yet unclassified
nthRoot: n
	^ [ self car = 1
		ifTrue: [ | R |
			R := nil.
			R := [ 1 asFPS
				+ (self derivative / (R ** (n - 1) * n asFPS)) integral ]
				srfi41StreamFPS ]
		ifFalse: [ (self car isZero and: [ self cdr car isZero ])
				ifTrue: [ [ 0 ] srfi41ConsFPS: [ self cdr cdr nthRoot: n ] ]
				ifFalse: [ Error signal ] ] ] srfi41StreamFPS