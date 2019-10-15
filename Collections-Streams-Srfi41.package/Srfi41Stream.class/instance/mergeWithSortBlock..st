as yet unclassified
mergeWithSortBlock: aBlock
	^ [ self
		letCarCdr: [ :carStream :streamOfStreams | 
			streamOfStreams ifEmpty:
				[ carStream srfi41Singleton ]
				ifNotEmpty: [ carStream
						mergeStream: (streamOfStreams mergeWithSortBlock: aBlock)
						withSortBlock: aBlock ] ]
		ifEmpty: [ {} asSrfi41Stream ] ] srfi41Stream