as yet unclassified
concatFair
	^ [ self
		ifEmpty: [ self ]
		ifNotEmpty: [ | carStream cdrOfStreams |
			carStream := self car.
			cdrOfStreams := self cdr.
			carStream
				ifEmpty: [ cdrOfStreams concatFair ]
				ifNotEmpty: [ [ carStream car ]
						srfi41Cons: [ (cdrOfStreams , carStream cdr srfi41Singleton) concatFair ] ] ] ]
		srfi41Stream