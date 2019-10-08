as yet unclassified
next: n
	^ [ (self isEmptyStream or: [ n isZero ]) 
		ifTrue: [ Srfi41Stream empty ]
		ifFalse: [ [ self car ]
				srfi41Cons: [ self cdr next: n - 1 ] ] ] srfi41Stream