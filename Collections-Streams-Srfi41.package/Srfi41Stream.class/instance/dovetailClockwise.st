as yet unclassified
dovetailClockwise
	^ self dovetailWith: [ :car :cdr | [ car ] srfi41ConsStream: cdr ]