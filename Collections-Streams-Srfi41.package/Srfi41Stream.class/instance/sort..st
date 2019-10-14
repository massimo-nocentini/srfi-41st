as yet unclassified
sort: aBlock
	^ [ self
		ifEmpty: [ self ]
		ifNotEmpty: [ | car cdr |
			car := self car.
			cdr := self cdr.
			((cdr select: [ :x | x < car ]) sort: aBlock)
				,  car  srfi41Singleton
				, ((cdr select: [ :x | x >= car ]) sort: aBlock) ] ] srfi41Stream