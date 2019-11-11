accessing
value: aSrfi41FormalPowerSeries
	^ [ aSrfi41FormalPowerSeries car isZero
		ifTrue: [ [ self car ]
				srfi41ConsFPS: [ aSrfi41FormalPowerSeries cdr
						* (self cdr value: aSrfi41FormalPowerSeries) ] ]
		ifFalse: [ | composition |
			composition := self cdr value: aSrfi41FormalPowerSeries.
			composition * aSrfi41FormalPowerSeries car + self car
				+ ([ 0 ] srfi41ConsFPS: [ aSrfi41FormalPowerSeries cdr * composition ]) ] ]
		srfi41StreamFPS