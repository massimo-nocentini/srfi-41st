as yet unclassified
next: n
	^ [ (self isEmpty or: [ n isZero ]) 
		ifTrue: [ {} asSrfi41Stream ]
		ifFalse: [ [ self car ]
				srfi41Cons: [ self cdr next: n - 1 ] ] ] srfi41Stream