as yet unclassified
dovetailClockwise
	^ [ self
		ifEmpty: [ {} asSrfi41Stream srfi41Repeat ]
		ifNotEmpty: [ | aStream |
			aStream := self car.
			aStream
				ifEmpty: [ self cdr dovetailClockwise ]
				ifNotEmpty: [ [ aStream car srfi41Singleton ]
						srfi41Cons: [ aStream cdr
								zip: self cdr dovetailClockwise 
								with: [ :car :cdr | [ car ] srfi41Cons: [ cdr ] ] ] ] ] ]
		srfi41Stream