*Collections-Streams-Srfi41
srfi41Block
	self numArgs = 1
		ifTrue: [ ^ [ :a | [ self value: a ] srfi41Stream ] ].
	self numArgs = 2
		ifTrue: [ ^ [ :a :b | [ self value: a value: b ] srfi41Stream ] ].
	self numArgs = 3
		ifTrue: [ ^ [ :a :b :c | [ self value: a value: b value: c ] srfi41Stream ] ].
	self numArgs = 4
		ifTrue: [ ^ [ :a :b :c :d | [ self value: a value: b value: c value: d ] srfi41Stream ] ]