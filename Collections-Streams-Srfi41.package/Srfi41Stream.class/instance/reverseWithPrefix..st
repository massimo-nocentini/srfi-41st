as yet unclassified
reverseWithPrefix: aStream
	^ [ self
		ifEmpty: [ aStream ]
		ifNotEmpty:
			[ self cdr reverseWithPrefix: ([ self car ] srfi41ConsSrfi41Stream: aStream) ] ]
		srfi41Stream