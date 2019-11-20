as yet unclassified
dovetailWith: aBlock
	^ [ self
		ifEmpty: [ {} asSrfi41Stream srfi41Repeat ]
		ifNotEmpty: [ | streamOfStreams |
			streamOfStreams := self cdr dovetailWith: aBlock.
			self car
				ifEmpty: [ streamOfStreams ]
				ifNotEmpty: [ :aStream | 
					[ aStream car srfi41Singleton ]
						srfi41Cons: [ aStream cdr zip: streamOfStreams with: aBlock ] ] ] ]
		srfi41Stream