as yet unclassified
ifNotEmpty: aBlockClosure
	^ self isEmptyStream
		ifTrue: [ self ]
		ifFalse: [ aBlockClosure cull: self ]