accessing
value: aSrfi41FormalPowerSeries
	^ [ | car |
	car := aSrfi41FormalPowerSeries stream car.
	car isZero
		ifTrue: [ [ self stream car ]
				srfi41ConsFPS: [ aSrfi41FormalPowerSeries stream cdr asFPS
						* (self stream cdr asFPS value: aSrfi41FormalPowerSeries) ] ]
		ifFalse: [ Error signal: 'hello' ] ] srfi41StreamFPS