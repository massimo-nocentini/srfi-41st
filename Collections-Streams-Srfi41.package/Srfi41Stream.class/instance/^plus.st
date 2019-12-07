as yet unclassified
+ aStream
	^ [ self
		ifEmpty: [ aStream ]
		ifNotEmpty: [ [ self car ] srfi41Cons: [ aStream + self cdr ] ] ]
		srfi41Stream