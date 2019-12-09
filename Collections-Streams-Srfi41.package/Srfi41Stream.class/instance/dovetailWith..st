as yet unclassified
dovetailWith: aBlock
	^ [ self
		ifEmpty: [ {} asSrfi41Stream srfi41Repeat ]
		ifNotEmpty: [ self car
				ifEmpty: [ self cdr dovetailWith: aBlock ]
				ifNotEmpty: [ :aStream | 
					[ aStream car srfi41Singleton ]
						srfi41Cons:
							[ aStream cdr zip: (self cdr dovetailWith: aBlock) with: aBlock ] ] ] ]
		srfi41Stream