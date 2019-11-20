as yet unclassified
concat
	^ [ self
		ifNotEmpty: [ self car
				ifEmpty: [ self cdr concat ]
				ifNotEmpty: [ :carStream | 
					[ carStream car ]
						srfi41Cons: [ ([ carStream cdr ] srfi41Cons: [ self cdr ]) concat ] ] ] ]
		srfi41Stream