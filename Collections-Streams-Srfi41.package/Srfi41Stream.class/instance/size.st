testing
size
	^  self ifEmpty: [ 0 ] ifNotEmpty:  [1 + self cdr size]