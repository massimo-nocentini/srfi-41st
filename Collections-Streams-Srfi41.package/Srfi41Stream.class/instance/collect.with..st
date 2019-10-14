as yet unclassified
collect: aBlockClosure with: aCombiner
	^ [ self
		ifEmpty: [ Srfi41Stream empty ]
		ifNotEmpty: [ aCombiner
				value: [ aBlockClosure value: self car ]
				value: [ self cdr collect: aBlockClosure with: aCombiner ] srfi41Stream ] ]
		srfi41Stream