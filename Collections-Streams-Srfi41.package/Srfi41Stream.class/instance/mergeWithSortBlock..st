as yet unclassified
mergeWithSortBlock: aBlock
	^ [ self
		ifEmpty: #yourself
		ifNotEmpty: [ | carStream |
			carStream := self car.
			self cdr
				ifEmpty: [ carStream ]
				ifNotEmpty: [ :streamOfStreams | 
					carStream
						mergeStream: (streamOfStreams mergeWithSortBlock: aBlock)
						withSortBlock: aBlock ] ] ] srfi41Stream