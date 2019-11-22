as yet unclassified
mergeStream: aStream withSortBlock: aBlock
	^ [ self
		ifEmpty: [ aStream ]
		ifNotEmpty: [ aStream
				ifEmpty: [ self ]
				ifNotEmpty: [ | otherCar car |
					car := self car.
					otherCar := aStream car.
					(aBlock value: car value: otherCar)
						ifTrue: [ [ car ]
								srfi41Cons: [ self cdr mergeStream: aStream withSortBlock: aBlock ] ]
						ifFalse: [ [ otherCar ]
								srfi41Cons: [ self mergeStream: aStream cdr withSortBlock: aBlock ] ] ] ] ]
		srfi41Stream