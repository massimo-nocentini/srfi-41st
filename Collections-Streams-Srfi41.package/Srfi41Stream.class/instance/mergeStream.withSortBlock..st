as yet unclassified
mergeStream: aStream withSortBlock: aBlock
	^ [ self
		letCarCdr: [ :car :cdr | 
			aStream
				letCarCdr: [ :otherCar :otherCdr | 
					(aBlock value: car value: otherCar)
						ifTrue: [ [ car ]
								srfi41Cons: [ cdr mergeStream: aStream withSortBlock: aBlock ] ]
						ifFalse: [ [ otherCar ]
								srfi41Cons: [ self mergeStream: otherCdr withSortBlock: aBlock ] ] ]
				ifEmpty: [ self ] ]
		ifEmpty: [ aStream ] ] srfi41Stream