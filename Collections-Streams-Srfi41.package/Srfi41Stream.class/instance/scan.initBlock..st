as yet unclassified
scan: aBlock initBlock: i
	^ [ self
		ifEmpty: [ i value srfi41Singleton ]
		ifNotEmpty: [ [ | car |
			car := i value.
			[ car ]
				srfi41Cons: [ self cdr
						scan: aBlock
						initBlock: [ aBlock value: car value: self car ] ] ]
				srfi41Stream ] ] srfi41Stream