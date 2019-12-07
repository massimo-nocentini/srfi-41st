as yet unclassified
dovetailClockwise
	^ self
		dovetailWith: [ :car :cdr | [ car ] srfi41ConsSrfi41Stream: cdr ]
		anObjectHasBeenSeen: false