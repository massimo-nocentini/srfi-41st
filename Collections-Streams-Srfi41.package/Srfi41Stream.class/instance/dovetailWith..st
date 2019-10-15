as yet unclassified
dovetailWith: aBlock
	^ [ self
		letCarCdr: [  :aStream  :streamOfStreams |
			aStream
				ifEmpty: [ streamOfStreams dovetailWith: aBlock ]
				ifNotEmpty: [ [ aStream car srfi41Singleton ]
						srfi41Cons: [ aStream cdr zip: (streamOfStreams dovetailWith: aBlock) with: aBlock ] ] ]
		ifEmpty: [ {} asSrfi41Stream srfi41Repeat ] ] srfi41Stream