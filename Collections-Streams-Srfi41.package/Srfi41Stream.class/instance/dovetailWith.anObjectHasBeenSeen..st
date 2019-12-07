as yet unclassified
dovetailWith: aBlock anObjectHasBeenSeen: aBoolean
	^ [ self
		ifEmpty: [ aBoolean
				ifTrue: [ {} asSrfi41Stream srfi41Repeat ]
				ifFalse: [ self ] ]
		ifNotEmpty: [ self car
				ifEmpty: [ self cdr dovetailWith: aBlock anObjectHasBeenSeen: aBoolean ]
				ifNotEmpty: [ :aStream | 
					[ aStream car srfi41Singleton ]
						srfi41Cons: [ aStream cdr
								zip: (self cdr dovetailWith: aBlock anObjectHasBeenSeen: true)
								with: aBlock ] ] ] ] srfi41Stream