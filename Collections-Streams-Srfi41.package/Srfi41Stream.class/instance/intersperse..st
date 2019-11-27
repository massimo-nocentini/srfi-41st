as yet unclassified
intersperse: x
	^ [ self
		ifEmpty: [ x srfi41Singleton srfi41Singleton ]
		ifNotEmpty: [ [ [ x ] srfi41ConsSrfi41Stream: self ]
				srfi41Cons: [ (self cdr intersperse: x)
						collect: [ :z | [ self car ] srfi41ConsSrfi41Stream: z ] ] ] ]
		srfi41Stream