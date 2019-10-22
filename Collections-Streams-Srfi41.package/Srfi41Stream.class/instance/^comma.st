as yet unclassified
, aStream
	^ [ self
		ifEmpty: [ aStream ]
		ifNotEmpty: [ [ self car ] srfi41Cons: [ self cdr , aStream ] ] ]
		srfi41Stream