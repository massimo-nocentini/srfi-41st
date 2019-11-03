as yet unclassified
atInteger: i
	^ self
		ifEmpty: [ SubscriptOutOfBounds signalFor: i ]
		ifNotEmpty: [ i = 1
				ifTrue: [ self car ]
				ifFalse: [ self cdr atInteger: i - 1 ] ]