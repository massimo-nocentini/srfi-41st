as yet unclassified
concat
	^ [ self
		ifEmpty: [ {} asSrfi41Stream ]
		ifNotEmpty: [ | carStream |
			carStream := self car.
			carStream
				ifEmpty: [ self cdr concat ]
				ifNotEmpty: [ [ carStream car ]
						srfi41Cons: [ ([ carStream cdr ] srfi41Cons: [ self cdr ]) concat ] ] ] ]
		srfi41Stream