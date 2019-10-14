as yet unclassified
dovetailCounterClockwise
	^ [ self
		ifEmpty: [ [ {} asSrfi41Stream ] srfi41Repeat ]
		ifNotEmpty: [ | aStream |
			aStream := self car.
			aStream
				ifEmpty: [ self cdr dovetailCounterClockwise ]
				ifNotEmpty: [ [  aStream car  srfi41Singleton ]
						srfi41Cons: [ aStream cdr
								zip: self cdr dovetailCounterClockwise
								with: [ :car :cdr | cdr , [ car ] srfi41Singleton ] ] ] ] ]
		srfi41Stream