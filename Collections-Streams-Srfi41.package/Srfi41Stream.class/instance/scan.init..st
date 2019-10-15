as yet unclassified
scan: aBlock init: i
	^ [ self
		ifEmpty: [ i srfi41Singleton ]
		ifNotEmpty: [
			[ i ]
				srfi41Cons: [ self cdr scan: aBlock init: (aBlock value: i value: self car) ] ] ]
		srfi41Stream