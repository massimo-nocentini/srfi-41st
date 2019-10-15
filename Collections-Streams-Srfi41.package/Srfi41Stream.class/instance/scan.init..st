as yet unclassified
scan: aBlock init: i
	^ [ self letCarCdr: [ :car :cdr | [ i ] srfi41Cons: [ cdr scan: aBlock init: (aBlock value:i value: car) ] ] ifEmpty: [ i srfi41Singleton ] ]
		srfi41Stream