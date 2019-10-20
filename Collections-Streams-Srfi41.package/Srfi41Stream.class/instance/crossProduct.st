as yet unclassified
crossProduct
	^ [ self
		letCarCdr: [ :aStream :aStreamOfStreams | 
			aStreamOfStreams
				ifEmpty: [ aStream collect: [ :each | Array with: each ] ]
				ifNotEmpty: [ | crossedStream |
					crossedStream := aStreamOfStreams crossProduct.
					aStream
						flatCollect: [ :each | 
							crossedStream
								collect: [ :aCdrStream | Array with:  each withAll: aCdrStream ] ] ] ]
		ifEmpty: [ {} asSrfi41Stream ] ] srfi41Stream