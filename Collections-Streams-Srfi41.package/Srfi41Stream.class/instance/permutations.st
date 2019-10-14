as yet unclassified
permutations
	^ [ self
		ifEmpty: [ [ {} asSrfi41Stream ] srfi41Singleton ]
		ifNotEmpty: [ (self cdr permutations
				collect: [ :each | each interleave: self car ]) concat ] ]
		srfi41Stream