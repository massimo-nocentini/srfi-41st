as yet unclassified
nextWhile: aPredicate
	^ [ self
		ifEmpty: [ {} asSrfi41Stream ]
		ifNotEmpty: [ (aPredicate value: self car)
				ifTrue: [ [ self car ] srfi41Cons: [ self cdr nextWhile: aPredicate ] ]
				ifFalse: [ {} asSrfi41Stream ] ] ] srfi41Stream