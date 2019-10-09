tests
collatzSequenceOf: n
	^ [ :x | x even ifTrue: [ x / 2 ] ifFalse: [ 3*x + 1 ] ] srfi41Iter value: n