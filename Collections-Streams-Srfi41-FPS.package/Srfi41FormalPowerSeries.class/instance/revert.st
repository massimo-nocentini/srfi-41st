accessing
revert
	^ [ self stream car isZero
		ifTrue: [ | Y |
			Y := nil.
			Y := [ 0 ]
				srfi41ConsFPS: [ (self stream cdr asFPS value: Y) reciprocal ] ]
		ifFalse: [ Error signal: 'hello' ] ] srfi41StreamFPS