as yet unclassified
concat
	

	^ [ self
		ifEmpty: [ self ]
		ifNotEmpty: [ | carStream cdrOfStreams |
			carStream := self car.
			cdrOfStreams := self cdr.
			carStream
				ifEmpty: [ cdrOfStreams concat ]
				ifNotEmpty: [ [ carStream car ]
						srfi41Cons: [ ([ carStream cdr ] srfi41Cons: [ cdrOfStreams ]) concat ] ] ] ]
		srfi41Stream