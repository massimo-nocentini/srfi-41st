as yet unclassified
mergeWithSortBlock: aBlock
	^ [ self
		letCarCdr: [ :carStream :streamOfStreams | 
			streamOfStreams isEmptyStream
				ifTrue: [ carStream srfi41Singleton ]
				ifFalse: [ carStream
						mergeStream: (streamOfStreams mergeWithSortBlock: aBlock)
						withSortBlock: aBlock ] ]
		ifEmpty: [ {} asSrfi41Stream ] ] srfi41Stream