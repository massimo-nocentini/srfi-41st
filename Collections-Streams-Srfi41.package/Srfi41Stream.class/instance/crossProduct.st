as yet unclassified
crossProduct
	^ [ self
		ifEmpty: #yourself
		ifNotEmpty: [ | aStream |
			aStream := self car.
			self cdr
				ifEmpty: [ aStream collect: [ :each | Array with: each ] ]
				ifNotEmpty: [ :aStreamOfStreams | 
					| crossedStream |
					crossedStream := aStreamOfStreams crossProduct.
					aStream
						flatCollect: [ :each | 
							crossedStream
								collect: [ :anArray | Array with: each withAll: anArray ] ] ] ] ]
		srfi41Stream