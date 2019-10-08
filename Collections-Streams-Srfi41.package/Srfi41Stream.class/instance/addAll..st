as yet unclassified
addAll: aStream
	^ [ self
		ifEmpty: [ aStream ]
		ifNotEmpty: [ [  self car ]
				srfi41Cons: [ self cdr addAll: aStream ] ] ] srfi41Stream