as yet unclassified
nextEvery: n
	^ [ self
		ifNotEmpty: [ [ self car ]
				srfi41Cons: [ | aStream |
					aStream := self cdr.
					1 to: n - 1 do: [ :each | aStream := aStream ifNotEmpty: [ aStream cdr ] ].
					aStream nextEvery: n ] ] ] srfi41Stream