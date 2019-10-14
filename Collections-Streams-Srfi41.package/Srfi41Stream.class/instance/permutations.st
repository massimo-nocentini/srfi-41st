as yet unclassified
permutations
	^ [ self
		ifEmpty: [ [ {} asSrfi41Stream ] srfi41Singleton ]
		ifNotEmpty: [ (self cdr permutations
				collect: [ :each | each intersperse: self car ]) concat ] ]
		srfi41Stream