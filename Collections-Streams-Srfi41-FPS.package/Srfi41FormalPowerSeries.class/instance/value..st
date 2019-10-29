accessing
value: aSrfi41FormalPowerSeries
	^ [ aSrfi41FormalPowerSeries car isZero
		ifTrue: [ [ self car ]
				srfi41ConsFPS: [ aSrfi41FormalPowerSeries cdr
						* (self cdr value: aSrfi41FormalPowerSeries) ] ]
		ifFalse: [ Error signal: 'hello' ] ] srfi41StreamFPS