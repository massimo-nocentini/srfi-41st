as yet unclassified
ifEmpty: aBlockClosure
	^ self isEmptyStream
		ifTrue: [ aBlockClosure cull: self ]
		ifFalse: [ self ]