as yet unclassified
** n
	^ [ (n isZero
		ifTrue: [ 1 asFPS ]
		ifFalse: [ self ** (n - 1) * self ]) stream ] srfi41Stream asFPS