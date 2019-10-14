as yet unclassified
concat
	^ [ self
		ifEmpty: [ {} asSrfi41Stream ]
		ifNotEmpty: [ | carStream cdrOfStreams |
			carStream := self car.
			cdrOfStreams := self cdr.
			carStream
				ifEmpty: [ cdrOfStreams concat ]
				ifNotEmpty: [ [ carStream car ]
						srfi41Cons: [ ([ carStream cdr ] srfi41ConsStream:  cdrOfStreams ) concat ] ] ] ]
		srfi41Stream