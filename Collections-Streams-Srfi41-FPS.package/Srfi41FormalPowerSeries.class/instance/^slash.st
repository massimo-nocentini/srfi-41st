as yet unclassified
/ aSrfi41FormalPowerSeries
	^ [ (self car isZero and: [ aSrfi41FormalPowerSeries car isZero ])
		ifTrue: [ self cdr / aSrfi41FormalPowerSeries cdr ]
		ifFalse: [ self * aSrfi41FormalPowerSeries reciprocal ] ]
		srfi41StreamFPSof: self var