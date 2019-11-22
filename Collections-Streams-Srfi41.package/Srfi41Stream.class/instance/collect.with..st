as yet unclassified
collect: aBlockClosure with: aCombiner
	^ [ self
		ifEmpty: #yourself
		ifNotEmpty: [ aCombiner
				value: [ aBlockClosure value: self car ]
				value: [ self cdr collect: aBlockClosure with: aCombiner ] ] ]
		srfi41Stream