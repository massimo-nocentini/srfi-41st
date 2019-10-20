testing
allSatisfy: aBlock
	^ self
		ifEmpty: [ true ]
		ifNotEmpty: [ (aBlock value: self car)
				ifTrue: [ self cdr allSatisfy: aBlock ]
				ifFalse: [ false ] ]