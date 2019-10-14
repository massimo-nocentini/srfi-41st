as yet unclassified
intersperse: x
	^ [ self
		ifEmpty: [ [ [ x ] srfi41Singleton ] srfi41Singleton ]
		ifNotEmpty: [ [ [ x ] srfi41Cons: [ self ] ] srfi41Singleton
				,
					((self cdr intersperse: x)
						collect: [ :z | [ self car ] srfi41ConsStream: z ]) ] ]
		srfi41Stream