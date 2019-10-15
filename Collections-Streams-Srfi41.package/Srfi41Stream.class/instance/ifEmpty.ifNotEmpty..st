testing
ifEmpty: eBlock ifNotEmpty: neBlock
	^ self isEmptyStream
		ifTrue: eBlock
		ifFalse: [neBlock cull: self]