testing
ifEmpty: eBlock ifNotEmpty: neBlock
	^ self isEmpty
		ifTrue: [ eBlock cull: self ]
		ifFalse: [ neBlock cull: self ]