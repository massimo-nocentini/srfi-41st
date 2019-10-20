as yet unclassified
crossProduct
	^ [ self
		letCarCdr: [ :aStream :aStreamOfStreams | 
			aStreamOfStreams
				ifEmpty: [ aStream collect: #srfi41Singleton ]
				ifNotEmpty: [ | crossedStream |
					crossedStream := aStreamOfStreams  crossProduct.
					aStream
						flatCollect: [ :each | 
							crossedStream
								collect: [ :aCdrStream | [ each ] srfi41ConsStream: aCdrStream ] ] ] ]
		ifEmpty: [ {} asSrfi41Stream ] ] srfi41Stream