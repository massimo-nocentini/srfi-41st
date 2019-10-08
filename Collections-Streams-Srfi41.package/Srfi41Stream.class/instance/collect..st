as yet unclassified
collect: aBlockClosure
	^ [self
		ifEmpty: [ Srfi41Stream empty ]
		ifNotEmpty: [ [ aBlockClosure value: self car ]
				srfi41Cons: [ self cdr collect: aBlockClosure ] ]] srfi41Stream 