as yet unclassified
sort: aBlock
	^ [ self
		ifEmpty: [ self ]
		ifNotEmpty: [ | car cdr |
			car := self car.
			cdr := self cdr.
			((cdr select: [ :x | aBlock value: x value: car ]) sort: aBlock)
				, car srfi41Singleton
				, ((cdr select: [ :x | (aBlock value: x value: car) not ]) sort: aBlock) ] ]
		srfi41Stream