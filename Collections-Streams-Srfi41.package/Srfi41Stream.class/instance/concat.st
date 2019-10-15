as yet unclassified
concat
	^ [ self
		letCarCdr: [  :carStream :cdrOfStreams |
			carStream
				ifEmpty: [ cdrOfStreams concat ]
				ifNotEmpty: [ [ carStream car ]
						srfi41Cons: [ ([ carStream cdr ] srfi41ConsStream: cdrOfStreams) concat ] ] ]
		ifEmpty: [ {} asSrfi41Stream ] ] srfi41Stream