as yet unclassified
allButLast
	^ [ (self isEmpty or: [ self cdr isEmpty ])
		ifTrue: [ {} asSrfi41Stream ]
		ifFalse: [ [ self car ] srfi41Cons: [ self cdr allButLast ] ] ]
		srfi41Stream