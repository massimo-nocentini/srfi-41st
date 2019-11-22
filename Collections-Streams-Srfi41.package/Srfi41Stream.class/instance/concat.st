as yet unclassified
concat
	^ [ self
		ifEmpty: #yourself
		ifNotEmpty: [ self car
				ifEmpty: [ self cdr concat ]
				ifNotEmpty: [ :aStream | 
					[ aStream car ]
						srfi41Cons: [ ([ aStream cdr ] srfi41Cons: [ self cdr ]) concat ] ] ] ]
		srfi41Stream