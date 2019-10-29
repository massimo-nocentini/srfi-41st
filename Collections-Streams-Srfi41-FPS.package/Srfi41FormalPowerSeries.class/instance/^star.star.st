as yet unclassified
** n
	^ [ n isZero
		ifTrue: [ 1 asFPS ]
		ifFalse: [ n isInteger
				ifTrue: [ self ** (n - 1) * self ]
				ifFalse: [ self ** n numerator nthRoot: n denominator ] ] ]
		srfi41StreamFPS