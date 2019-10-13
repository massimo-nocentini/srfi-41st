as yet unclassified
layers
	^ [ [ (self
		collect: [ :aStream | 
			aStream
				ifEmpty: [ {} asSrfi41Stream ]
				ifNotEmpty: [ [ aStream car ] srfi41Singleton ] ]) concat ]
		srfi41Cons: [ (self collect: #cdr) layers ].
	 ]
		srfi41Stream