accessing
streamOf: aCollection
	^ [ aCollection
		ifEmpty: [ Srfi41Stream empty ]
		ifNotEmpty: [ [ aCollection first ]
				srfi41Cons: [ self streamOf: aCollection allButFirst  ] ] ]
		srfi41Stream