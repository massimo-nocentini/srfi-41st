as yet unclassified
nextWhile: aPredicate
	^ [ self
		ifNotEmpty: [ | car |
			car := self car.
			(aPredicate value: car)
				ifTrue: [ [ car ] srfi41Cons: [ self cdr nextWhile: aPredicate ] ]
				ifFalse: [ {} asSrfi41Stream ] ] ] srfi41Stream