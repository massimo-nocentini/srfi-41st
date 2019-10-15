as yet unclassified
rejectWhile: aPredicate
	^ [ self
		ifEmpty: [ {} asSrfi41Stream ]
		ifNotEmpty: [ (aPredicate value: self car)
				ifTrue: [ [self cdr nextWhile: aPredicate] srfi41Stream  ]
				ifFalse: [ self ] ] ] srfi41Stream