as yet unclassified
scan: aBlock initBlock: i
	^ [ self
		ifEmpty: [ i value srfi41Singleton ]
		ifNotEmpty: [ [ i value ]
				srfi41Cons: [ self cdr scan: aBlock initBlock: [(aBlock value: i value value: self car)] ] ] ]
		srfi41Stream