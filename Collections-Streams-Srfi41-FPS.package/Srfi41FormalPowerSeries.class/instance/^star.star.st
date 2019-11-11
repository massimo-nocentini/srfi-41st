as yet unclassified
** n
	^ [ n isZero
		ifTrue: [ 1 asFPSof: self var ]
		ifFalse: [ n isInteger
				ifTrue: [ self ** (n - 1) * self ]
				ifFalse: [ self ** n numerator nthRoot: n denominator ] ] ]
		srfi41StreamFPSof: self var