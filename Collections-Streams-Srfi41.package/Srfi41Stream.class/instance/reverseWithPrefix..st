as yet unclassified
reverseWithPrefix: aStream
	^ [ self
		ifEmpty: [ aStream ]
		ifNotEmpty:
			[ self cdr reverseWithPrefix: ([ self car ] srfi41ConsStream: aStream) ] ]
		srfi41Stream