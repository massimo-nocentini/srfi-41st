as yet unclassified
dovetailCounterClockwise
	^ self
		dovetailWith: [ :car :cdr | cdr , car srfi41Singleton ]
		anObjectHasBeenSeen: false