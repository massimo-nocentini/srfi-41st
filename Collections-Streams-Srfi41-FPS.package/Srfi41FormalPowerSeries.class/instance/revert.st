accessing
revert
	^ [ self car isZero
		ifTrue: [ | Y |
			Y := nil.
			Y := [ 0 ] srfi41ConsFPS: [ (self cdr value: Y) reciprocal ] ]
		ifFalse: [ Error signal: 'hello' ] ] srfi41StreamFPS