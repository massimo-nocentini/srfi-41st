as yet unclassified
dovetailWith: aBlock
	^ [ self
		ifEmpty: #yourself
		ifNotEmpty: [ self car
				ifEmpty: [ self cdr dovetailWith: aBlock ]
				ifNotEmpty: [ :firstStream | 
					[ firstStream car srfi41Singleton ]
						srfi41Cons: [ firstStream cdr
								zipLongest: (self cdr dovetailWith: aBlock)
								with: [ :anObj :aStream :isNothing | 
									(isNothing value: aStream)
										ifTrue: [ anObj srfi41Singleton ]
										ifFalse: [ (isNothing value: anObj)
												ifTrue: [ aStream ]
												ifFalse: [ aBlock value: anObj value: aStream ] ] ] ] ] ] ]
		srfi41Stream