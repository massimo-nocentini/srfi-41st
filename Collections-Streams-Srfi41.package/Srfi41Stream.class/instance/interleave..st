as yet unclassified
interleave: x
	^ [ self
		ifEmpty: [ [ [ x ] srfi41Singleton ] srfi41Singleton ]
		ifNotEmpty: [ [ [ x ] srfi41Cons: [ self ] ] srfi41Singleton
				,
					((self cdr interleave: x)
						collect: [ :z | [ self car ] srfi41Cons: [ z ] ]) ] ]
		srfi41Stream